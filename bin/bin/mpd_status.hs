{-# LANGUAGE OverloadedStrings #-}

import Control.Monad.IO.Class (liftIO)
import Data.ByteString.Char8 as B (ByteString, unpack)
import qualified Data.Map as M (lookup)
import Data.Maybe (fromMaybe)
import Data.Text as T (Text, unpack, pack, append)
import Data.Text.Encoding (decodeUtf8)
import Network.MPD
import System.Posix.Env.ByteString (getEnv)
import Text.Read (readMaybe)

main :: IO ()
main = do
  out <- withMPD main'
  case out of
    (Left msg) -> print msg
    (Right l) -> putStrLn $ T.unpack l

main' :: MPD T.Text
main' = do
  initStatus <- status
  let initState = stState initStatus
  let initVol = stVolume initStatus
  button <- liftIO $ getEnv "BLOCK_BUTTON"
  (curState, curVol) <-
    case button of
      (Just env) -> do
        let cmd = readMaybe $ B.unpack env
        op cmd initState initVol
      Nothing -> return (initState, initVol)
  song <- currentSong
  return $ decodeUtf8 (extract song) +++ info curState curVol

op :: Maybe Int -> State -> Maybe Int -> MPD (State, Maybe Int)
op Nothing s v = return (s, v)
op (Just cmd) state vol =
  case cmd of
    1 ->
      case state of
        Playing -> pause True >> return (Paused, vol)
        Paused -> pause False >> return (Playing, vol)
        Stopped -> play Nothing >> return (Playing, vol)
    2 -> clear >> add "" >> random True >> play Nothing >> return (Playing, vol)
    3 -> stop >> return (Stopped, vol)
    4 -> setVolume' inc
    5 -> setVolume' dec
    8 -> previous >> return (Playing, vol)
    9 -> next >> return (Playing, vol)
    _ -> noChange
  where
    noChange = return (state, vol)
    setVolume' f =
      case vol of
        Just v -> setVolume (f v) >> return (state, Just $ f v)
        Nothing -> noChange

info :: State -> Maybe Int -> T.Text
info state vol =
  case (state, vol) of
    (Stopped, _) -> " [stopped]"
    (Playing, Just 100) -> ""
    (Playing, Just v) -> " [" +++ volIndicator v +++ "%]"
    (Paused, Just 100) -> " [paused]"
    (Paused, Just v) -> " [paused | " +++ volIndicator v +++ "%]"
    (_, Nothing) -> ""
  where
    volIndicator v = symbol v +++ " " +++ T.pack (show v)
    symbol v
      | v > 49 = "\61480"
      | v > 0 = "\61479"
      | otherwise = "\61478"

extract :: Maybe Song -> B.ByteString
extract song =
  fromMaybe "invalid song" $
  do tags <- sgTags <$> song
     title <- extract' =<< M.lookup Title tags
     artist <- extract' =<< M.lookup Artist tags
     return $ artist `mappend` " - " `mappend` title
  where
    extract' :: [Value] -> Maybe B.ByteString
    extract' [] = Nothing
    extract' (b:_) = Just $ toUtf8 b

inc :: Int -> Int
inc volume = min 100 $ (volume `div` 5 + 1) * 5

dec :: Int -> Int
dec volume = max 0 (base5 `div` 5) * 5
  where
    base5 =
      if volume `mod` 5 == 0
        then volume - 1
        else volume

(+++) :: Text -> Text -> Text
(+++) = append

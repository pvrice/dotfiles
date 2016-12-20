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
  button <- liftIO $ getEnv "BLOCK_BUTTON"
  curStatus <-
    case button of
      (Just env) -> do
        let cmd = readMaybe $ B.unpack env
        updated <- op cmd initStatus
        if updated
          then status
          else return initStatus
      Nothing -> return initStatus
  song <- currentSong
  return $ decodeUtf8 (extract song) +++ info curStatus

op :: Maybe Int -> Status -> MPD Bool
op Nothing _ = return False
op (Just cmd) s =
  case cmd of
    1 ->
      case stState s of
        Playing -> pause True >> return True
        Paused -> pause False >> return True
        Stopped -> play Nothing >> return True
    2 -> clear >> add "" >> random True >> play Nothing >> return False
    3 -> stop >> return True
    4 -> setVolume' inc >> return True
    5 -> setVolume' dec >> return True
    8 -> previous >> return False
    9 -> next >> return False
    _ -> return False
  where
    vol = stVolume s
    setVolume' f =
      case vol of
        Just v -> setVolume $ f v
        Nothing -> return ()

info :: Status -> T.Text
info s =
  case (vol, state) of
    (_, Stopped) -> " [stopped]"
    (Just 100, Playing) -> ""
    (Just v, Playing) -> " [" +++ volIndicator v +++ "%]"
    (Just 100, Paused) -> " [paused]"
    (Just v, Paused) -> " [paused | " +++ volIndicator v +++ "%]"
    (Nothing, _) -> ""
  where
    vol = stVolume s
    state = stState s
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

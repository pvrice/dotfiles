{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ExtendedDefaultRules #-}
{-# OPTIONS_GHC -fno-warn-type-defaults #-}

import Shelly
import Data.Text as T

default (T.Text)

main =
    shelly $
    silently $
    do vol <- getVol
       button <- get_env_text "BLOCK_BUTTON"
       unless (T.null button) $
           mapM_ (escaping False . run_ "mpc" . (: [])) $
           mpcCommand
               (read $ unpack button)
               (vol >>= wrapSafe T.null (read . unpack))
       paused <- ("paused" `isInfixOf`) <$> cmd "mpc"
       name <- wrapSafe T.null T.init <$> cmd "mpc" "current"
       mute <- ("off" `isInfixOf`) <$> cmd "amixer" "get" "Master"
       newVol <-
           case (vol, button) of
               (Just v,"4") -> return . Just . inc . read $ unpack v
               (Just v,"5") -> return . Just . dec . read $ unpack v
               (Just v,_) -> return $ Just v
               (Nothing,"2") -> tryVol
               (Nothing,_) -> getVol
       echo $ line name newVol paused mute

getVol :: Sh (Maybe Text)
getVol =
    wrapSafe (== "n/a\n") T.init <$>
    escaping False (cmd "mpc" "volume | tr -d volume:\\ \\%")

tryVol :: Sh (Maybe Text)
tryVol = do
    vol <- getVol
    case vol of
        Just v -> return $ Just v
        Nothing -> tryVol

wrapSafe :: (t -> Bool) -> (t -> a) -> t -> Maybe a
wrapSafe p f n =
    if p n
        then Nothing
        else Just $ f n

mpcCommand :: Int -> Maybe Int -> [Text]
mpcCommand block_button volume =
    case block_button of
        1 -> ["toggle"]
        2 -> ["clear", "listall | mpc add", "random on", "play"]
        3 -> ["stop"]
        4 -> [incdec inc]
        5 -> [incdec dec]
        8 -> ["prev"]
        9 -> ["next"]
        _ -> [""]
  where
    incdec f =
        case volume of
            Just v -> "volume " +++ f v
            Nothing -> ""

inc :: Int -> Text
inc volume = pack . show $ min 100 $ (volume `div` 5 + 1) * 5

dec :: Int -> Text
dec volume = pack . show $ max 0 (base5 `div` 5) * 5
  where
    base5 =
        if volume `mod` 5 == 0
            then volume - 1
            else volume

line :: Maybe Text -> Maybe Text -> Bool -> Bool -> Text
line nameM volM paused mute =
    case (nameM, volM) of
        (Just name,Just vol) -> name +++ checkVol vol paused mute
        _ -> "MPD stopped"

checkVol :: Text -> Bool -> Bool -> Text
checkVol vol paused mute =
    if volInt == 100
        then sameVol
        else diffVol
  where
    sameVol =
        if paused || mute
            then " [paused]"
            else ""
    diffVol =
        if paused || mute
            then " [paused | " +++ volDisplay
            else " [" +++ volDisplay
    symbol
      | volInt > 49 = "\61480"
      | volInt > 0 = "\61479"
      | otherwise = "\61478"
    volInt = read $ unpack vol :: Int
    volDisplay = symbol +++ " " +++ vol +++ "%]"

(+++) :: Text -> Text -> Text
(+++) = append

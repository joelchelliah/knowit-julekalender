import Data.Maybe (fromJust)
import Data.Time

time y m d hh mm ss = UTCTime date time where
    date = fromJust (fromGregorianValid y m d)
    time = hh * 60 * 60 + mm * 60 + ss

main = print . show . diffUTCTime (time 1814 5 17 13 37 14) $ time 2015 9 17 17 15 0

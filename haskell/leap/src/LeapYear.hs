module LeapYear
  ( isLeapYear
  ) where

divides :: Integer -> Integer -> Bool
divides d x = (x `rem` d) == 0

isLeapYear :: Integer -> Bool
isLeapYear y = multiple4 && (not multiple100 || multiple400)
  where
    multiple4 = 4 `divides` y
    multiple100 = 100 `divides` y
    multiple400 = 400 `divides` y

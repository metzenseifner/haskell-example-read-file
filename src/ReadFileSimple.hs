module Main where

-- Easy high-level delayed eval of input approach
main :: IO ()
main = do 
  inputStr <- readFile "./input.txt"
  print inputStr

-- Equivalent lower-level delayed eval of input approach
-- import System.IO
-- main :: IO ()
-- main = do 
--   inputHandle <- openFile "./input.txt" ReadMode
--   inputStr <- hGetContents inputHandle
--   print inputStr
--   hClose inputHandle

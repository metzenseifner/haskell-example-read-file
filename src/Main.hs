module Main where
import Options.Applicative

-- Data Record to contain validated input data
data Values = Values {
  inputPath :: String
} deriving (Show)

pathParser :: Parser String
pathParser = strOption
  (long "file" 
    <> short 'f' 
    <> value "." 
    <> showDefault 
    <> help "Path to input file" 
    <> metavar "FILE")

-- Define Values constructor using applicative syntax
-- whereby  <$> 
valuesParser :: Parser Values
valuesParser = Values <$> pathParser

-- Easy high-level delayed eval of input approach
main :: IO ()
main = do 
    input    <- execParser inputValuesParser
    inputStr <- readFile (inputPath input)
    print inputStr
  where
    inputValuesParser :: ParserInfo Values
    inputValuesParser = info (valuesParser <**> helper)
      ( fullDesc 
      <> progDesc "This program demonstrates inputting an arbitrary file path and processing it."
      <> header "Haskell CLI" )

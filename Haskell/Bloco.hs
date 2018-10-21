data Bloco = Bloco { index :: Int
                   , timestamp :: Int
                   , dados :: [Transacao]
                   , hashAnterior :: String
                   , hash :: String
                   } deriving (Show)

data Transacao = Transacao { sender :: Int
                           , receiver :: Int
                           , valor :: Int
                           } deriving (Show)

data Bloco = Bloco { index :: Int
                   , timestamp :: Int
                   , dados :: [Transacao]
                   , hashAnterior :: String
                   , hash :: String
                   } deriving (Show)

data Blockchain = Blockchain { cadeia :: [Bloco] } deriving (Show)


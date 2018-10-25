-- DATA TYPES
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

addTransacaoPendente :: Transacao -> TransacoesPendentes -> TransacoesPendentes 
addTransacaoPendente transacao pool = TransacoesPendentes (transacoes pool ++ [transacao])

data TransacoesPendentes = TransacoesPendentes { transacoes :: [Transacao] } deriving (Show)

-- BLOCKCHAIN FUNCTIONS
genesis = Bloco 0 0 [Transacao 7 0 1000, Transacao 7 1 1000] "before" "genesis"

addBloco :: Bloco -> Blockchain -> Blockchain
addBloco bloco chain = Blockchain (cadeia chain ++ [bloco])

-- MAIN
main :: IO ()
main = do
    menu

-- MENU
menu :: IO ()
menu = do
      putStrLn "MyTinyBlockchain"
      putStrLn . unlines $ map concatNums opcoes
      choice <- getLine
      case validaOpcao choice of
         Just n  -> execute . read $ choice
         Nothing -> putStrLn "Digite uma opcao valida"

      menu
   where concatNums (i, (s, _)) = show i ++ ". " ++ s

validaOpcao :: String -> Maybe Int
validaOpcao s = isValid (reads s)
   where isValid []            = Nothing
         isValid ((n, _):_) 
               | outOfBounds n = Nothing
               | otherwise     = Just n
         outOfBounds n = (n < 1) || (n > length opcoes)

opcoes :: [(Int, (String, IO ()))]
opcoes = zip [1.. ] [
   ("Enviar dinheiro", enviarDinheiroIO)
 , ("Exibir saldo", exibirSaldoIO)
 , ("Minerar bloco", minerarBlocoIO)
 , ("Exibir transacoes pendentes", exibirTransacoesPendentesIO)
 , ("Sair", sairIO)
 ]

execute :: Int -> IO ()
execute n = doExec $ filter (\(i, _) -> i == n) opcoes
   where doExec ((_, (_,f)):_) = f


-- IO FUNCTIONS
enviarDinheiroIO :: IO ()
enviarDinheiroIO = do
    putStrLn "Enviar dinheiro"

    putStrLn "Sender (0 para Alice e 1 para Bob): "
    sender <- getLine

    putStrLn "Valor: "
    valor <- getLine

    putStrLn "Transacao adicionada ao buffer de transacoes a serem mineradas"
    putStrLn "Para efetivar a transacao, minere um bloco"

exibirSaldoIO :: IO()    
exibirSaldoIO = do
    putStrLn "Exibir saldo"

    putStrLn "Alice: ????"
    putStrLn "Bob: ????"

minerarBlocoIO :: IO()
minerarBlocoIO = do
    putStrLn "Minera bloco"

    chain <- (readFile "chain.txt")
    txs_raw <- (readFile "pool.txt")             
    let chain_params = init (split chain '\n')
    let params = chain_params !! 0
    let formatted = split params '-'
    let bloco = Bloco (read (formatted !! 0)) (read (formatted !! 1)) (obterTransacoesIO (formatted !! 2)) (formatted !! 3) (formatted !! 4)
 
    let txs_lines = init (split txs_raw '\n')
    let txs = map obterPoolTransacaoIO txs_lines
 
    let newBloco = criarBloco bloco txs
    writeFile "chain_tmp.txt" $ show (index newBloco) ++ "-" ++ show (timestamp newBloco) ++ "-" ++ concat (intersperse "," $ map formatTransacao $ dados newBloco) ++ "-" ++ show (hashAnterior newBloco) ++ "-" ++ show (hash newBloco) ++ "\n"
  
    writeFile "pool.txt" ""
    updateBlockchainIO

exibirTransacoesPendentesIO :: IO()
exibirTransacoesPendentesIO = do
    putStrLn "Exibir transações pendentes"

    putStrLn "Transacoes pendentes:"
    putStrLn "????"

sairIO :: IO()
sairIO = do
    putStrLn "Sair"
    return ()

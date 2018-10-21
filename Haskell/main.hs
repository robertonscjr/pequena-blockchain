main :: IO ()
main = do
    menu

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
   ("Enviar dinheiro", enviarDinheiro)
 , ("Exibir saldo", exibirSaldo)
 , ("Minerar bloco", minerarBloco)
 , ("Exibir transacoes pendentes", exibirTransacoesPendentes)
 , ("Sair", sair)
 ]

execute :: Int -> IO ()
execute n = doExec $ filter (\(i, _) -> i == n) opcoes
   where doExec ((_, (_,f)):_) = f

enviarDinheiro = undefined
exibirSaldo = undefined
minerarBloco = undefined
exibirTransacoesPendentes = undefined
sair = undefined

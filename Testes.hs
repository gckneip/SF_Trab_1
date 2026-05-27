module Testes where
import Memory
import EBigStep
import BBigStep
import CBigStep

---- Memória

testaProcuraVar :: IO ()
testaProcuraVar = do
    putStrLn "=== Teste procuraVar ==="
    putStrLn "  procuraVar [(\"x\",10),(\"y\",5)] \"x\""
    putStrLn $ "  resultado = " ++ show (procuraVar [("x",10), ("y",5)] "x")
    putStrLn "  procuraVar [(\"x\",10),(\"y\",5)] \"y\""
    putStrLn $ "  resultado = " ++ show (procuraVar [("x",10), ("y",5)] "y")
    putStrLn ""

testaMudaVar :: IO ()
testaMudaVar = do
    putStrLn "=== Teste mudaVar ==="
    putStrLn "  mudaVar [(\"x\",10),(\"y\",5)] \"x\" 20"
    putStrLn $ "  resultado = " ++ show (mudaVar [("x",10), ("y",5)] "x" 20)
    putStrLn "  mudaVar [(\"x\",10),(\"y\",5)] \"y\" 100"
    putStrLn $ "  resultado = " ++ show (mudaVar [("x",10), ("y",5)] "y" 100)
    putStrLn ""

---- Expressões Aritméticas

testaNum :: IO ()
testaNum = do
    putStrLn "=== Teste Num ==="
    putStrLn "  ebigStep (Num 42, [])"
    putStrLn $ "  resultado = " ++ show (ebigStep (Num 42, []))
    putStrLn ""

testaVar :: IO ()
testaVar = do
    putStrLn "=== Teste Var ==="
    putStrLn "  ebigStep (Var \"x\", [(\"x\",7),(\"y\",3)])"
    putStrLn $ "  resultado = " ++ show (ebigStep (Var "x", [("x",7), ("y",3)]))
    putStrLn "  ebigStep (Var \"y\", [(\"x\",7),(\"y\",3)])"
    putStrLn $ "  resultado = " ++ show (ebigStep (Var "y", [("x",7), ("y",3)]))
    putStrLn ""

testaSoma :: IO ()
testaSoma = do
    putStrLn "=== Teste Soma ==="
    putStrLn "  ebigStep (Soma (Num 3) (Num 4), [(\"x\",10),(\"y\",5)])"
    putStrLn $ "  resultado = " ++ show (ebigStep (Soma (Num 3) (Num 4), [("x",10), ("y",5)]))
    putStrLn "  ebigStep (Soma (Var \"x\") (Var \"y\"), [(\"x\",10),(\"y\",5)])"
    putStrLn $ "  resultado = " ++ show (ebigStep (Soma (Var "x") (Var "y"), [("x",10), ("y",5)]))
    putStrLn ""

testaSub :: IO ()
testaSub = do
    putStrLn "=== Teste Sub ==="
    putStrLn "  ebigStep (Sub (Num 10) (Num 3), [(\"x\",10),(\"y\",5)])"
    putStrLn $ "  resultado = " ++ show (ebigStep (Sub (Num 10) (Num 3), [("x",10), ("y",5)]))
    putStrLn "  ebigStep (Sub (Var \"x\") (Var \"y\"), [(\"x\",10),(\"y\",5)])"
    putStrLn $ "  resultado = " ++ show (ebigStep (Sub (Var "x") (Var "y"), [("x",10), ("y",5)]))
    putStrLn ""

testaMult :: IO ()
testaMult = do
    putStrLn "=== Teste Mult ==="
    putStrLn "  ebigStep (Mult (Num 3) (Num 4), [(\"x\",10),(\"y\",5)])"
    putStrLn $ "  resultado = " ++ show (ebigStep (Mult (Num 3) (Num 4), [("x",10), ("y",5)]))
    putStrLn "  ebigStep (Mult (Var \"x\") (Var \"y\"), [(\"x\",10),(\"y\",5)])"
    putStrLn $ "  resultado = " ++ show (ebigStep (Mult (Var "x") (Var "y"), [("x",10), ("y",5)]))
    putStrLn ""

testaDiv :: IO ()
testaDiv = do
    putStrLn "=== Teste Div ==="
    putStrLn "  ebigStep (Div (Num 10) (Num 2), [(\"x\",10),(\"y\",5)])"
    putStrLn $ "  resultado = " ++ show (ebigStep (Div (Num 10) (Num 2), [("x",10), ("y",5)]))
    putStrLn "  ebigStep (Div (Var \"x\") (Var \"y\"), [(\"x\",10),(\"y\",5)])"
    putStrLn $ "  resultado = " ++ show (ebigStep (Div (Var "x") (Var "y"), [("x",10), ("y",5)]))
    putStrLn ""

testaExpressoesAritmeticas :: IO ()
testaExpressoesAritmeticas = do
    putStrLn "=== Teste Expressoes Aritmeticas Combinadas ==="
    putStrLn "  ebigStep (Mult (Soma (Num 2) (Num 3)) (Sub (Var \"x\") (Var \"y\")), [(\"x\",10),(\"y\",5)])"
    putStrLn $ "  resultado = " ++ show (ebigStep (Mult (Soma (Num 2) (Num 3)) (Sub (Var "x") (Var "y")), [("x",10), ("y",5)]))
    putStrLn ""

---- Expressões Booleanas

testaTRUE :: IO ()
testaTRUE = do
    putStrLn "=== Teste TRUE ==="
    putStrLn "  bbigStep (TRUE, [])"
    putStrLn $ "  resultado = " ++ show (bbigStep (TRUE, []))
    putStrLn ""

testaFALSE :: IO ()
testaFALSE = do
    putStrLn "=== Teste FALSE ==="
    putStrLn "  bbigStep (FALSE, [])"
    putStrLn $ "  resultado = " ++ show (bbigStep (FALSE, []))
    putStrLn ""

testaNot :: IO ()
testaNot = do
    putStrLn "=== Teste Not ==="
    putStrLn "  bbigStep (Not TRUE, [])"
    putStrLn $ "  resultado = " ++ show (bbigStep (Not TRUE, []))
    putStrLn "  bbigStep (Not FALSE, [])"
    putStrLn $ "  resultado = " ++ show (bbigStep (Not FALSE, []))
    putStrLn ""

testaAnd :: IO ()
testaAnd = do
    putStrLn "=== Teste And ==="
    putStrLn "  bbigStep (And TRUE TRUE, [])"
    putStrLn $ "  resultado = " ++ show (bbigStep (And TRUE TRUE, []))
    putStrLn "  bbigStep (And TRUE FALSE, [])"
    putStrLn $ "  resultado = " ++ show (bbigStep (And TRUE FALSE, []))
    putStrLn "  bbigStep (And FALSE TRUE, [])"
    putStrLn $ "  resultado = " ++ show (bbigStep (And FALSE TRUE, []))
    putStrLn "  bbigStep (And FALSE FALSE, [])"
    putStrLn $ "  resultado = " ++ show (bbigStep (And FALSE FALSE, []))
    putStrLn ""

testaOr :: IO ()
testaOr = do
    putStrLn "=== Teste Or ==="
    putStrLn "  bbigStep (Or TRUE TRUE, [])"
    putStrLn $ "  resultado = " ++ show (bbigStep (Or TRUE TRUE, []))
    putStrLn "  bbigStep (Or TRUE FALSE, [])"
    putStrLn $ "  resultado = " ++ show (bbigStep (Or TRUE FALSE, []))
    putStrLn "  bbigStep (Or FALSE TRUE, [])"
    putStrLn $ "  resultado = " ++ show (bbigStep (Or FALSE TRUE, []))
    putStrLn "  bbigStep (Or FALSE FALSE, [])"
    putStrLn $ "  resultado = " ++ show (bbigStep (Or FALSE FALSE, []))
    putStrLn ""

testaLeq :: IO ()
testaLeq = do
    putStrLn "=== Teste Leq ==="
    putStrLn "  bbigStep (Leq (Num 3) (Num 5), [(\"x\",5),(\"y\",10)])"
    putStrLn $ "  resultado = " ++ show (bbigStep (Leq (Num 3) (Num 5), [("x",5), ("y",10)]))
    putStrLn "  bbigStep (Leq (Num 10) (Num 5), [(\"x\",5),(\"y\",10)])"
    putStrLn $ "  resultado = " ++ show (bbigStep (Leq (Num 10) (Num 5), [("x",5), ("y",10)]))
    putStrLn "  bbigStep (Leq (Var \"x\") (Var \"y\"), [(\"x\",5),(\"y\",10)])"
    putStrLn $ "  resultado = " ++ show (bbigStep (Leq (Var "x") (Var "y"), [("x",5), ("y",10)]))
    putStrLn ""

testaIgual :: IO ()
testaIgual = do
    putStrLn "=== Teste Igual ==="
    putStrLn "  bbigStep (Igual (Num 3) (Num 3), [(\"x\",5),(\"y\",5),(\"z\",10)])"
    putStrLn $ "  resultado = " ++ show (bbigStep (Igual (Num 3) (Num 3), [("x",5), ("y",5), ("z",10)]))
    putStrLn "  bbigStep (Igual (Num 3) (Num 5), [(\"x\",5),(\"y\",5),(\"z\",10)])"
    putStrLn $ "  resultado = " ++ show (bbigStep (Igual (Num 3) (Num 5), [("x",5), ("y",5), ("z",10)]))
    putStrLn "  bbigStep (Igual (Var \"x\") (Var \"y\"), [(\"x\",5),(\"y\",5),(\"z\",10)])"
    putStrLn $ "  resultado = " ++ show (bbigStep (Igual (Var "x") (Var "y"), [("x",5), ("y",5), ("z",10)]))
    putStrLn "  bbigStep (Igual (Var \"x\") (Var \"z\"), [(\"x\",5),(\"y\",5),(\"z\",10)])"
    putStrLn $ "  resultado = " ++ show (bbigStep (Igual (Var "x") (Var "z"), [("x",5), ("y",5), ("z",10)]))
    putStrLn ""

---- Comandos

testaSkip :: IO ()
testaSkip = do
    putStrLn "=== Teste Skip ==="
    putStrLn "  comando: cbigStep (Skip, [(\"x\",10),(\"y\",5)])"
    let s = [("x",10), ("y",5)]
    putStrLn $ "  resultado = " ++ show (cbigStep (Skip, s))
    putStrLn ""

testaAtrib :: IO ()
testaAtrib = do
    putStrLn "=== Teste Atrib (atribuicao simples) ==="
    putStrLn "  comando: cbigStep (Atrib (Var \"y\") (Soma (Var \"x\") (Num 3)), [(\"x\",10),(\"y\",5)])"
    let s = [("x",10), ("y",5)]
    let (_, s1) = cbigStep (Atrib (Var "y") (Soma (Var "x") (Num 3)), s)
    putStrLn $ "  resultado = " ++ show s1
    putStrLn $ "  y = " ++ show (procuraVar s1 "y") ++ " (esperado: 13)"
    putStrLn ""

testaAtribMultiplas :: IO ()
testaAtribMultiplas = do
    putStrLn "=== Teste Atrib (multiplas atribuicoes) ==="
    putStrLn "  comando 1: cbigStep (Atrib (Var \"y\") (Mult (Num 3) (Var \"x\")), [(\"x\",2),(\"y\",0),(\"z\",0)])"
    let s0 = [("x",2), ("y",0), ("z",0)]
    let (_, s1) = cbigStep (Atrib (Var "y") (Mult (Num 3) (Var "x")), s0)
    putStrLn $ "  resultado 1 = " ++ show s1
    putStrLn "  comando 2: cbigStep (Atrib (Var \"z\") (Soma (Var \"y\") (Num 1)), resultado1)"
    let (_, s2) = cbigStep (Atrib (Var "z") (Soma (Var "y") (Num 1)), s1)
    putStrLn $ "  resultado 2 = " ++ show s2
    putStrLn $ "  z = " ++ show (procuraVar s2 "z") ++ " (esperado: 7)"
    putStrLn ""

testaAtribComExpressao :: IO ()
testaAtribComExpressao = do
    putStrLn "=== Teste Atrib (expressao composta) ==="
    putStrLn "  comando: cbigStep (Atrib (Var \"z\") (Div (Mult (Soma (Var \"x\") (Var \"y\")) (Num 2)) (Num 3)), [(\"x\",10),(\"y\",5),(\"z\",0)])"
    let s = [("x",10), ("y",5), ("z",0)]
    let e = Div (Mult (Soma (Var "x") (Var "y")) (Num 2)) (Num 3)
    let (_, s1) = cbigStep (Atrib (Var "z") e, s)
    putStrLn $ "  resultado = " ++ show s1
    putStrLn $ "  z = " ++ show (procuraVar s1 "z")
    putStrLn ""

---- Testes para comandos NAO implementados (mostram erro esperado)

testaNaoImplementado :: String -> IO ()
testaNaoImplementado nome = do
    putStrLn $ "=== " ++ nome ++ " [NAO IMPLEMENTADO] ==="
    putStrLn $ "  Este comando ainda nao possui regra de semantica em CBigStep.hs"
    putStrLn ""

testaSeq :: IO ()
testaSeq = do
    putStrLn "=== Teste Seq (sequencia de comandos) ==="
    putStrLn "  comando: cbigStep (Seq (Atrib (Var \"x\") (Num 5)) (Atrib (Var \"y\") (Soma (Var \"x\") (Num 1))), [(\"x\",0),(\"y\",0)])"
    let (_, s) = cbigStep (Seq (Atrib (Var "x") (Num 5)) (Atrib (Var "y") (Soma (Var "x") (Num 1))), [("x",0), ("y",0)])
    putStrLn $ "  resultado = " ++ show s
    putStrLn $ "  x = " ++ show (procuraVar s "x") ++ " (esperado: 5)"
    putStrLn $ "  y = " ++ show (procuraVar s "y") ++ " (esperado: 6)"
    putStrLn ""
    putStrLn "=== Teste swap com Seq (x=10,y=5 -> x=5,y=10) ==="
    putStrLn "  comando: cbigStep (Seq (Atrib (Var \"temp\") (Var \"x\")) (Seq (Atrib (Var \"x\") (Var \"y\")) (Atrib (Var \"y\") (Var \"temp\"))), [(\"x\",10),(\"y\",5),(\"temp\",0)])"
    let (_, s2) = cbigStep (Seq (Atrib (Var "temp") (Var "x"))
                                (Seq (Atrib (Var "x") (Var "y"))
                                     (Atrib (Var "y") (Var "temp"))),
                           [("x",10), ("y",5), ("temp",0)])
    putStrLn $ "  resultado = " ++ show s2
    putStrLn $ "  x = " ++ show (procuraVar s2 "x") ++ " (esperado: 5)"
    putStrLn $ "  y = " ++ show (procuraVar s2 "y") ++ " (esperado: 10)"
    putStrLn ""

testaIf :: IO ()
testaIf = do
    putStrLn "=== Teste If (condicao verdadeira) ==="
    putStrLn "  comando: cbigStep (If (Leq (Num 3) (Num 5)) (Atrib (Var \"x\") (Num 100)) (Atrib (Var \"x\") (Num 0)), [(\"x\",10)])"
    let (_, s1) = cbigStep (If (Leq (Num 3) (Num 5)) (Atrib (Var "x") (Num 100)) (Atrib (Var "x") (Num 0)), [("x",10)])
    putStrLn $ "  3 <= 5 e' True => x := 100"
    putStrLn $ "  resultado = " ++ show s1
    putStrLn $ "  x = " ++ show (procuraVar s1 "x") ++ " (esperado: 100)"
    putStrLn ""
    putStrLn "=== Teste If (condicao falsa) ==="
    putStrLn "  comando: cbigStep (If (Leq (Num 10) (Num 3)) (Atrib (Var \"x\") (Num 100)) (Atrib (Var \"x\") (Num 0)), [(\"x\",10)])"
    let (_, s2) = cbigStep (If (Leq (Num 10) (Num 3)) (Atrib (Var "x") (Num 100)) (Atrib (Var "x") (Num 0)), [("x",10)])
    putStrLn $ "  10 <= 3 e' False => x := 0"
    putStrLn $ "  resultado = " ++ show s2
    putStrLn $ "  x = " ++ show (procuraVar s2 "x") ++ " (esperado: 0)"
    putStrLn ""

testaWhile :: IO ()
testaWhile = do
    putStrLn "=== Teste While (fatorial) ==="
    putStrLn "  comando: While (Not (Igual (Var \"x\") (Num 1))) (Seq (Atrib (Var \"y\") (Mult (Var \"y\") (Var \"x\"))) (Atrib (Var \"x\") (Sub (Var \"x\") (Num 1))))"
    let prog = While (Not (Igual (Var "x") (Num 1)))
                      (Seq (Atrib (Var "y") (Mult (Var "y") (Var "x")))
                           (Atrib (Var "x") (Sub (Var "x") (Num 1))))
    let (_, s) = cbigStep (Seq (Atrib (Var "y") (Num 1)) prog, [("x",5), ("y",0)])
    putStrLn $ "  resultado = " ++ show s
    putStrLn $ "  y = " ++ show (procuraVar s "y") ++ " (esperado: 120 = 5!)"
    putStrLn ""

testaTenTimes :: IO ()
testaTenTimes = do
    putStrLn "=== Teste TenTimes (incrementar x 10 vezes) ==="
    putStrLn "  comando: TenTimes (Atrib (Var \"x\") (Soma (Var \"x\") (Num 1)))"
    let (_, s) = cbigStep (TenTimes (Atrib (Var "x") (Soma (Var "x") (Num 1))), [("x",0)])
    putStrLn $ "  resultado = " ++ show s
    putStrLn $ "  x = " ++ show (procuraVar s "x") ++ " (esperado: 10)"
    putStrLn ""
    putStrLn "=== Teste TenTimes com x=5 ==="
    let (_, s2) = cbigStep (TenTimes (Atrib (Var "x") (Soma (Var "x") (Num 1))), [("x",5)])
    putStrLn $ "  resultado = " ++ show s2
    putStrLn $ "  x = " ++ show (procuraVar s2 "x") ++ " (esperado: 15)"
    putStrLn ""

testaRepeat :: IO ()
testaRepeat = do
    putStrLn "=== Teste Repeat until (x ate 5) ==="
    putStrLn "  comando: Repeat (Atrib (Var \"x\") (Soma (Var \"x\") (Num 1))) (Igual (Var \"x\") (Num 5))"
    let (_, s) = cbigStep (Repeat (Atrib (Var "x") (Soma (Var "x") (Num 1))) (Igual (Var "x") (Num 5)), [("x",0)])
    putStrLn $ "  resultado = " ++ show s
    putStrLn $ "  x = " ++ show (procuraVar s "x") ++ " (esperado: 5)"
    putStrLn ""

testaLoop :: IO ()
testaLoop = do
    putStrLn "=== Teste Loop (0 a 5) ==="
    putStrLn "  comando: Loop (Num 0) (Num 5) (Atrib (Var \"x\") (Soma (Var \"x\") (Num 1)))"
    let (_, s) = cbigStep (Loop (Num 0) (Num 5) (Atrib (Var "x") (Soma (Var "x") (Num 1))), [("x",0)])
    putStrLn $ "  resultado = " ++ show s
    putStrLn $ "  x = " ++ show (procuraVar s "x") ++ " (esperado: 5)"
    putStrLn ""
    putStrLn "=== Teste Loop com variaveis (2 a 7) ==="
    putStrLn "  comando: Loop (Var \"a\") (Var \"b\") (Atrib (Var \"x\") (Soma (Var \"x\") (Num 1)))"
    let (_, s2) = cbigStep (Loop (Var "a") (Var "b") (Atrib (Var "x") (Soma (Var "x") (Num 1))), [("a",2), ("b",7), ("x",0)])
    putStrLn $ "  resultado = " ++ show s2
    putStrLn $ "  x = " ++ show (procuraVar s2 "x") ++ " (esperado: 5)"
    putStrLn ""

testaDuplaATrib :: IO ()
testaDuplaATrib = do
    putStrLn "=== Teste DuplaATrib (atribuicao dupla) ==="
    putStrLn "  comando: DuplaATrib (Var \"x\") (Var \"y\") (Num 10) (Num 20)"
    let (_, s) = cbigStep (DuplaATrib (Var "x") (Var "y") (Num 10) (Num 20), [("x",0), ("y",0)])
    putStrLn $ "  resultado = " ++ show s
    putStrLn $ "  x = " ++ show (procuraVar s "x") ++ " (esperado: 10)"
    putStrLn $ "  y = " ++ show (procuraVar s "y") ++ " (esperado: 20)"
    putStrLn ""
    putStrLn "=== Teste DuplaATrib simultanea (troca com avaliação unica) ==="
    putStrLn "  comando: DuplaATrib (Var \"x\") (Var \"y\") (Var \"y\") (Var \"x\")"
    let (_, s2) = cbigStep (DuplaATrib (Var "x") (Var "y") (Var "y") (Var "x"), [("x",1), ("y",2)])
    putStrLn $ "  resultado = " ++ show s2
    putStrLn $ "  x = " ++ show (procuraVar s2 "x") ++ " (esperado: 2)"
    putStrLn $ "  y = " ++ show (procuraVar s2 "y") ++ " (esperado: 1)"
    putStrLn ""

testaAtribCond :: IO ()
testaAtribCond = do
    putStrLn "=== Teste AtribCond (condicao verdadeira) ==="
    putStrLn "  comando: AtribCond (Leq (Num 3) (Num 5)) (Var \"x\") (Num 100) (Num 0)"
    let (_, s1) = cbigStep (AtribCond (Leq (Num 3) (Num 5)) (Var "x") (Num 100) (Num 0), [("x",10)])
    putStrLn $ "  3 <= 5 e' True => x := 100"
    putStrLn $ "  resultado = " ++ show s1
    putStrLn $ "  x = " ++ show (procuraVar s1 "x") ++ " (esperado: 100)"
    putStrLn ""
    putStrLn "=== Teste AtribCond (condicao falsa) ==="
    putStrLn "  comando: AtribCond (Leq (Num 10) (Num 3)) (Var \"x\") (Num 100) (Num 0)"
    let (_, s2) = cbigStep (AtribCond (Leq (Num 10) (Num 3)) (Var "x") (Num 100) (Num 0), [("x",10)])
    putStrLn $ "  10 <= 3 e' False => x := 0"
    putStrLn $ "  resultado = " ++ show s2
    putStrLn $ "  x = " ++ show (procuraVar s2 "x") ++ " (esperado: 0)"
    putStrLn ""

testaSwap :: IO ()
testaSwap = do
    putStrLn "=== Teste Swap (troca variaveis) ==="
    putStrLn "  comando: Swap (Var \"x\") (Var \"y\")"
    let (_, s) = cbigStep (Swap (Var "x") (Var "y"), [("x",10), ("y",5)])
    putStrLn $ "  resultado = " ++ show s
    putStrLn $ "  x = " ++ show (procuraVar s "x") ++ " (esperado: 5)"
    putStrLn $ "  y = " ++ show (procuraVar s "y") ++ " (esperado: 10)"
    putStrLn ""

---- Rodar todos os testes

todos :: IO ()
todos = do
    putStrLn "========================================"
    putStrLn "  TESTES DE MEMORIA"
    putStrLn "========================================"
    testaProcuraVar
    testaMudaVar

    putStrLn "========================================"
    putStrLn "  TESTES DE EXPRESSOES ARITMETICAS"
    putStrLn "========================================"
    testaNum
    testaVar
    testaSoma
    testaSub
    testaMult
    testaDiv
    testaExpressoesAritmeticas

    putStrLn "========================================"
    putStrLn "  TESTES DE EXPRESSOES BOOLEANAS"
    putStrLn "========================================"
    testaTRUE
    testaFALSE
    testaNot
    testaAnd
    testaOr
    testaLeq
    testaIgual

    putStrLn "========================================"
    putStrLn "  TESTES DE COMANDOS"
    putStrLn "========================================"
    testaSkip
    testaAtrib
    testaAtribMultiplas
    testaAtribComExpressao
    testaIf
    testaSeq
    testaWhile
    testaTenTimes
    testaRepeat
    testaLoop
    testaDuplaATrib
    testaAtribCond
    testaSwap

    putStrLn "========================================"
    putStrLn "  FIM DOS TESTES"
    putStrLn "========================================"

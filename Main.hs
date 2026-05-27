module Main where
import Memory 
import BBigStep
import CBigStep
import EBigStep
import Testes

main :: IO ()
main = print ("Trabalho 1 - Gustavo Cunha Kneip")

--------------------------------------
---
--- Exemplos de programas para teste
---
--- O ALUNO DEVE IMPLEMENTAR EXEMPLOS DE PROGRAMAS QUE USEM:
--- * Loop
--- * Dupla Atribuição
--- * Repeat until
--- * swap
--- * atrib cond
-------------------------------------

exSigma2 :: Memoria
exSigma2 = [("x",3), ("y",0), ("z",0)]


---
--- O progExp1 é um programa que usa apenas a semântica das expressões aritméticas. Esse
--- programa já é possível rodar com a implementação inicial  fornecida:

progExp1 :: E
progExp1 = Soma (Num 3) (Soma (Var "x") (Var "y"))

---
--- para rodar:
-- *Main> ebigStep (progExp1, exSigma)
-- 13
-- *Main> ebigStep (progExp1, exSigma2)
-- 6

--- Para rodar os próximos programas é necessário primeiro implementar as regras da semântica
---


--- Exemplos de expressões booleanas:

teste1 :: B
teste1 = (Leq (Soma (Num 3) (Num 3))  (Mult (Num 2) (Num 3)))

teste2 :: B
teste2 = (Leq (Soma (Var "x") (Num 3))  (Mult (Num 2) (Num 3)))


-- Exemplos de Programas Imperativos:

testec1 :: C
testec1 = (Seq (Seq (Atrib (Var "z") (Var "x")) (Atrib (Var "x") (Var "y"))) 
               (Atrib (Var "y") (Var "z")))

fatorial :: C
fatorial = (Seq (Atrib (Var "y") (Num 1))
                (While (Not (Igual (Var "x") (Num 1)))
                       (Seq (Atrib (Var "y") (Mult (Var "y") (Var "x")))
                            (Atrib (Var "x") (Sub (Var "x") (Num 1))))))

-- Exemplo usando Loop: soma 1 a x 5 vezes (Loop 0 5)
exLoop :: C
exLoop = Loop (Num 0) (Num 5) (Atrib (Var "x") (Soma (Var "x") (Num 1)))

-- Exemplo usando DuplaATrib: atribui x=10 e y=20 simultaneamente
exDuplaATrib :: C
exDuplaATrib = DuplaATrib (Var "x") (Var "y") (Num 10) (Num 20)

-- Exemplo usando Repeat: incrementa x até chegar a 5
exRepeat :: C
exRepeat = Repeat (Atrib (Var "x") (Soma (Var "x") (Num 1))) (Igual (Var "x") (Num 5))

-- Exemplo usando Swap: troca x e y
exSwap :: C
exSwap = Swap (Var "x") (Var "y")

-- Exemplo usando AtribCond: se x <= 0 entao y:=1 senao y:=2
exAtribCond :: C
exAtribCond = AtribCond (Leq (Var "x") (Num 0)) (Var "y") (Num 1) (Num 2)

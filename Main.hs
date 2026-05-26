module Main where
import Memory 
import BBigStep
import CBigStep
import EBigStep

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


-- ---
-- --- Exemplos de expressões booleanas:


-- teste1 :: B
-- teste1 = (Leq (Soma (Num 3) (Num 3))  (Mult (Num 2) (Num 3)))

-- teste2 :: B
-- teste2 = (Leq (Soma (Var "x") (Num 3))  (Mult (Num 2) (Num 3)))


-- ---
-- -- Exemplos de Programas Imperativos:

-- testec1 :: C
-- testec1 = (Seq (Seq (Atrib (Var "z") (Var "x")) (Atrib (Var "x") (Var "y"))) 
--                (Atrib (Var "y") (Var "z")))

-- fatorial :: C
-- fatorial = (Seq (Atrib (Var "y") (Num 1))
--                 (While (Not (Igual (Var "x") (Num 1)))
--                        (Seq (Atrib (Var "y") (Mult (Var "y") (Var "x")))
--                             (Atrib (Var "x") (Sub (Var "x") (Num 1))))))
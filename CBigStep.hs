module CBigStep where
import BBigStep
import EBigStep
import Memory

data C = While B C
    | If B C C
    | Seq C C
    | Atrib E E
    | Skip
    | TenTimes C   ---- Executa o comando C 10 vezes
    | Repeat C B --- Repeat C until B: executa C enquanto B é falso
    | Loop E E C      ---- Loop e1 e2 c: executa (e2 - e1) vezes o comando C 
    | DuplaATrib E E E E -- recebe 2 variáveis e 2 expressões (DuplaATrib (Var v1) (Var v2) e1 e2) e faz v1:=e1 e v2:=e2
    | AtribCond B E E E --- AtribCond b (Var v1) e1 e2: se b for verdade, então faz v1:e1, se B for falso faz v1:=e2
    | Swap E E -- swap(x,y): troca o conteúdo das variáveis x e y 
   deriving(Eq,Show)   
   
cbigStep :: (C,Memoria) -> (C,Memoria)

cbigStep (Skip,s) = (Skip,s)
cbigStep (If b c1 c2,s)
  | bbigStep (b,s) = cbigStep (c1,s)
  | otherwise      = cbigStep (c2,s)

cbigStep (Seq c1 c2,s) = cbigStep (c2,s')
  where (_, s') = cbigStep (c1,s)

cbigStep (Atrib (Var x) e,s) = (Skip, (mudaVar s x (ebigStep (e,s))  ))  

cbigStep (While b c,s)
  | bbigStep (b,s) = let (_, s') = cbigStep (c,s) in cbigStep (While b c, s')
  | otherwise = (Skip,s)

cbigStep (Loop e1 e2 c, s)
  | ebigStep (Sub e1 e2, s) >= 0 = (Skip, s)
  | otherwise = let (_, s') = cbigStep (c, s)
                in cbigStep (Loop (Num (ebigStep (e1, s) + 1)) e2 c, s')

cbigStep (TenTimes c, s) = cbigStep (Loop (Num 0) (Num 10) c, s)

cbigStep (Repeat c b, s) = cbigStep (Seq c (While (Not b) c), s)

cbigStep (DuplaATrib (Var v1) (Var v2) e1 e2, s) =
  (Skip, mudaVar (mudaVar s v1 (ebigStep (e1, s))) v2 (ebigStep (e2, s)))

cbigStep (AtribCond b (Var v1) e1 e2, s)
  | bbigStep (b, s) = (Skip, mudaVar s v1 (ebigStep (e1, s)))
  | otherwise       = (Skip, mudaVar s v1 (ebigStep (e2, s)))

cbigStep (Swap (Var x) (Var y), s) =
  (Skip, mudaVar (mudaVar s x (procuraVar s y)) y (procuraVar s x))


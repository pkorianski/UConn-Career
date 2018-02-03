(* Homework Assignment 2 created by Patrick Korianski *)

(* Pre Homework Testing*)
(* fun insert e nil = [e]
  | insert e (a::b) = if e>a
                      then a::(insert e b)
                      else e::a::b;
fun iSort nil = nil
  | iSort (a::b) = insert a (iSort b); *)


(* Question 1 *)

fun length [] = 0
    | length (x::xs) = 1 + length xs;

(*)
fun qSort l f = if (l = nil) then nil          (* Base case if empty list*)
                else if (length l = 1) then l  (* Base case if list has length=1 *)
                else                           (* Actually code when there is a list with length greater than 1*)
                  let
                      val (pointer::rList) = l (* I set the first item to be the pointer*)
                      fun part(nil) = ??? (* beginning the partition. I was not exactly sure how I could split the lower part and high part*)
                            .....
                  in
                      (* Once getting partition working, I wanted to recursively call qSort on the lower and higher partitions but I could not figure out how to partition them correctly*)
                  end;
*)

(* Question 2 *)
(*fun qsHigh l f = if (l = nil) then nil            (* Two base cases like shown in number 1*)
                 else if (length l = 1) then l
                 else
                    let
                        val (pointer::rList) = l   (* Setting up what l is equal to and I thought that its first variable would be easiest to be the pointer*)
                        fun qAux(nil) = ??
                          | fun qAux() =
                                foldr f [] l              (* I was not sure how to get both the low and high for this problem either*)
                    in
                    end; *)

(* Question 3 *)
fun cross a b = if (a = nil) then nil
                else if (b = nil) then nil
                else
                  let
                      val (x::xs) = a
                      fun combine nil = nil
                        | combine (y::ys) = (x,y)::combine(ys)
                  in
                      combine(b)
                      @
                      (cross xs b)
                  end;

(* Question 4 *)
fun crossHigh a b = if (a = nil) then nil      (* Both base cases because if either a or b is nil then there wont be a cross-product*)
                    else if (b = nil) then nil
                    else
                      let
                          val (x::xs) = a
                          val (y::ys) = b
                          fun aux nil = nil
                            | aux (y::ys)  = foldr op:: [] [x,y]
                      in
                          aux(b) :: aux(ys) ::nil (* I got stuck on how to iterate through both lists at this point*)
                      end;

(* Question 5 *)
(* fun crossFold a b = foldr *) (* I am a bit confused how to implement this one, I had seen some examples on foldr (fn) functions in the book but was not sure how to correctly implement them*)

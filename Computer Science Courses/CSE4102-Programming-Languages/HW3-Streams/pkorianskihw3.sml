(* Homework 3: Streams completed by Patrick Korianski *)

(* Introduction *)

datatype 'a Stream = Nil
            | Cons of 'a * (unit -> 'a Stream);
exception Bad of string;

(* The implementation of from packages the seed with an anonymous SML function that effectively delays the construction of a new stream tail *)
fun from seed next = Cons(seed, fn () => from (next seed) next);

fun head (Nil) = raise Bad("got nil in head")
  | head (Cons(a,b)) = a;

fun tail (Nil) = raise Bad("got nil in tail")
  | tail(Cons(a,b)) = b();

(* Utility function that extracts the first n elements from a stream s*)
fun take 0 stream      = nil
  | take n (Nil)       = raise Bad("got nil in take")
  | take n (Cons(h,t)) = h::(take (n-1) (t()));


(* Question 1 *)

(* Part 1 *)
val nat = from 1.0 (fn x=> x+1.0)

(* Part 2 *)
val one = from 1.0 (fn x=> x)

(* Part 3 *)
val zeroes = from 0.0 (fn x=> x)

(* Part 4 *)
val alt = from 1.0 (fn x=> x * ~1.0)


(* Question 2 *)
fun mul a b = Cons(((head a: real) * (head b: real)), fn()=>(mul (tail a) (tail b)));


(* Question 3 *)
(* Val num created the first stream of numbers 1 - n *)
(* val factStream created a stream of factorials that was -1 of the num stream, meaning if the value in num was 1 then numStreams corresponding value would be fact(0)*)
(* In the Question 3 description, it showed the observation of multiplying two streams which is why I created two streams here*)
(* Then after creating the two streams, I used the function mul that was created in question 2 to find the correct answer*)
val fs = let val num = from 1.0 (fn x=> x+1.0)
             fun fact(y: real) = if y<1.0 then 1.0
                                 else
                                 y * fact(y-1.0);
             fun numlook n = let
                                val curr = head(n) - 1.0
                             in
                                Cons(fact(curr), fn()=>numlook(tail n))
                             end;
             val factStream = numlook num;
          in
              Cons(1.0, fn() => mul num factStream)
          end;


(* Question 4*)
(* When looking at the Cons implementation, I say that the first object is the head and the second is a function*)
(* Saying that, I thought it would be easiest to put another Cons within the fn inside the first cons*)
(* By doing this, I was able to update two spots at once then could update it by iterating through weave and calling the tails of both original streams*)
fun weave a b = Cons(head(a), fn()=> Cons(head(b), fn()=> weave (tail a) (tail b)));


(* Question 5 *)
(* Starting it a 1.0 if you times x by y I am essentially times it by which number index I am at in the stream*)
(* For example, after the first time around which puts 1.0 as the head, y=2 so x*y also equals x^2, following y=3 so x^y also equals x^3 *)
fun px x = from 1.0 (fn y=> x * y);


(* Question 6 *)
(* In this program, I did 1.0 / the head of the s stream and then iterated through frac so it would go through each item of the s stream*)
fun frac s = Cons((1.0 / (head s)), fn()=> frac (tail s));


(* Question 7 *)
val coefs = frac fs;
fun eval s x order = let
                        val answer = take order (mul s (px x));
                     in
                        foldl (op+) 0.0 answer
                     end;
fun ex x = eval coefs x 10;


(* Question 8 *)
fun eval2 s x order = let
                        val answer = (mul s (px x))                                         (* I computed the original stream to get the pattern of the Taylor Expansion*)
                        fun everyother n = Cons((head n), fn()=> everyother(tail (tail n))) (* This function made a stream that consisted of every other variable that was in the answer stream *)
                        val streamWithN = everyother answer                                 (* This is initializing the everyother stream*)
                        val streamofNeg = px ~1.0                                           (* Creates a alternating stream of 1's and ~1's like shown here [1.~1, 1, ~1, 1, ....]*)
                        val finalStream = take order (mul streamWithN streamofNeg)          (* This multiplies both the everyother stream with the alternating neg stream and also uses take to specify the length it will go until*)
                      in
                        foldl (op+) 0.0 finalStream                                         (* This addes all the items together which were stored in finalStream to get the final answer*)
                      end;
fun ex2 x = eval2 coefs x 10; (* This is the same function as in question 7 but used to find the 10th order of my eval2 function in question 8*)

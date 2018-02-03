(* Homework 1: ML Basics: Completed by Patrick Korianski    *)

(* Question 1 *)
(* Part 1 *)
fun sum n = if n=1 then 1 else n + sum(n-1);

(* Part 2 *)
fun sumsq n = if n=1 then 1 else (n*n) + sumsq(n-1);

(* Part 3 *)
fun sumOdd n = if n=0 then 0
               else (2*n-1) + sumOdd(n-1);

(* Part 4 *)
fun fib n = if n=0 then 0
            else if n=1 then 1
            else fib(n-2) +fib(n-1);

(* Part 5 *) (* I used a tuple here because I thought it would be easy to pertray the past and current fib numbers and also found it was easier to write shorter and concise code*)
fun fibFast n = if n<2 then {CURRENT_NTH = n, PAST = 0}
                else let val {CURRENT_NTH = curr, PAST = past} = fibFast(n-1)
                     in {CURRENT_NTH = curr+past, PAST = curr}
                     end;

(* Question 2 *)
(* fun fact(n) = if n=0 then 1 else n * fact(n-1);  aux function to compute factorial *)
fun power(x,y) = if y < 1.0
                 then 1.0
                 else power(x,y-1.0) * x;

fun sinappx n x =  if (n < 1.0) (* if n=0 then sinappx=x because while solving the equation with i=0, you get x *)
                   then x
                   else
                      let
                        fun sinAuxLinear(n, d, i) =
                          let  val numer = ~1.0 * n * power(x, 2.0)
                               val denom = d * power((2.0 * i), 2.0)
                               val fractValue = (numer/denom)
                               val incre = i + 1.0
                          in
                            if i >= n then fractValue   (* Since real's do not have equality like 1.0 = 1.0, I did when i>=n meaning that the summation starts at i=0 and will end once i=n *)
                            else fractValue + sinAuxLinear(numer, denom, incre)
                          end;
                       in
                         x + sinAuxLinear(x, 1.0, 1.0)
                    end;

(* Question 3 *)

(* When looking at the trapezoidal model, I noticed that the pattern from the wiki link and also from looking on khan academy that the pattern is as follows: *)
(*  Summation of f(x2 - x)/2 * (b-a / h) + ..., this equation goes until x2=b *)

(* I used cube to test my integral function *)
(* I was trying to debug why my numbers were a bit off but could not figure out the correct solution*)
fun cube x : real = x*x*x;

fun integrate f a b n =
    let
      val h = b - a / n
      fun intAux k : real =
        let val x = (k * h) + a
            val x2 = ((k + 1.0) * h) + a
        in
          if(x2 <= b)
          then
            ((f(x2) - f(x))/2.0) * h
          else 0.0
        end;
      fun grandTotal i =
        if i>=n then intAux i
        else grandTotal(i + 1.0) + intAux i
    in grandTotal 0.0
    end;


(* Question 4 *)

fun sum nil = 0
 | sum (a::b) = a + sum b;

fun length nil = 0
 | length (a::b) = 1 + length b;

fun squareSum nil = 0
  | squareSum (a::b) = a*a + squareSum b;

fun variance list = if list = nil then 0.0
                    else
                      let
                        val len = length list
                        val rSum = sum list
                        val pSum = squareSum list
                      in
                       real(pSum)*(1.0/real len) - ((real(rSum)*(1.0/real len)) * (real(rSum)*(1.0/real len)))
                      end;

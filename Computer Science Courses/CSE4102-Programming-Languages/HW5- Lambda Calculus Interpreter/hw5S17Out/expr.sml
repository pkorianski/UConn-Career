use "set.sml";
use "lambda.sml";
use "church.sml";

structure Main = struct
structure L : LExpr = Lambda;
structure C : ChurchSig = Church;

(* This is the test function for the 3rd expression -- plus -- *)
fun test3 () =
    let open L in
	let val t = abs("x",apply(var "f",apply(var "x",var "x")))
	    val Y = abs("f",apply(t,t))
      val tlam = abs("a", abs("b", var("a")))
      val flam = abs("a", abs("b", var("b")))
	    val succ = abs("n",abs("s",abs("z",apply(var("s"),apply(apply(var("n"),var("s")),var("z"))))));
      val isZero = abs("n", apply(var("n"), apply(abs("x",flam),tlam)))
	    val plus = abs("n", abs("m", apply(var("n"), apply(succ, var("m")))))
	    val mult = apply(abs("n", abs("m", abs("f", var("n")))),apply(var("m"), var("f")))
	    val pair = abs("a", abs("b", abs("z", apply(apply(var("z"), var("a")),var("b")))))
      val first  = apply(abs("p", var("p")),abs("a", abs("b", var("a"))))
	    val second = apply(abs("p", var("p")),abs("a", abs("b", var("b"))))
      val np = apply(abs("p", pair), apply(apply(second, var("p")), apply(succ, apply(second, var("p")))))
      val pred = apply(abs("n", first), apply(var("n"), apply(np, apply(apply(pair, isZero), isZero))))


      (* My tests of the Lambda Calculus Interpreter*)
      val t1Succ = apply(succ, C.int2Church 5)
      val t2Succ = apply(succ, C.int2Church 2)
      val t3Succ = apply(succ, C.int2Church 10000)
      val t1isZero = apply(isZero, C.int2Church 1)
      val t2isZero = apply(isZero, C.int2Church 0)
      val t3isZero = apply(isZero, C.int2Church 11)
      val t1plus = apply(apply(plus,(C.int2Church 2)),(C.int2Church 3))
      val t2plus = apply(apply(plus,(C.int2Church 3)),(C.int2Church 5))
      val t3plus = apply(apply(plus,(C.int2Church 5)),(C.int2Church 7))
      val t1mult = apply(apply(plus,(C.int2Church 5)),(C.int2Church 7))
      val t2mult = apply(apply(plus,(C.int2Church 6)),(C.int2Church 8))
      val t3mult = apply(apply(plus,(C.int2Church 10)),(C.int2Church 5))
      val t1pair = apply(apply(pair,(C.int2Church 10)),(C.int2Church 5))
      val t2pair = apply(apply(pair,(C.int2Church 1)),(C.int2Church 0))
      val t3pair = apply(apply(pair,(C.int2Church 2)),(C.int2Church 4))
      val t1first = apply(first, t1pair)
      val t2first = apply(first, t2pair)
      val t3first = apply(first, t3pair)
      val t1second = apply(second, t1pair)
      val t2second = apply(second, t2pair)
      val t3second = apply(second, t3pair)
      val t1pred = apply(pred, C.int2Church 4)
      val t2pred = apply(pred, C.int2Church 10)
      val t3pred = apply(pred, C.int2Church 15)


	in  toString pred (*print (toString (simp t1mult)  ^ "\n") *)   (* (beta (beta (beta (beta (t1Succ)))))*)
	end
    end

(*
fun fib arg =
    let open L in
	let val t = abs("x",apply(var "f",apply(var "x",var "x")))
	    val Y = abs("f",apply(t,t))
	    val succ = abs("n",abs("s",abs("z",
						   apply(var "s",
							 apply(apply(var "n",
								     var "s"),
							       var "z")))))

		       (*
			Please, fill in your implementation by inlining all the required
			definitions to implement the Fibonacci function
			*)
	    val fib = ....
            val carg = C.int2Church arg
	    val fibe = apply(apply(Y,fib),carg)
	in print ("RES:" ^ ((toString (simp fibe)) ^ "\n"))
	end
    end
*)


end

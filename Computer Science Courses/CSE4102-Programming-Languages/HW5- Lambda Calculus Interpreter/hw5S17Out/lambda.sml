signature LExpr = sig
    exception Bad of string
    datatype expr = var   of string
	          | apply of expr   * expr
	          | abs   of string * expr
    type 'a Set
    val toString : expr -> string
    val freeV    : expr -> string Set
    val newName  : string Set -> string
    val subst    : string -> expr -> expr -> expr
    val alpha    : expr -> string Set -> expr
    val normal   : expr -> bool
    val beta     : expr -> expr
    val simp     : expr -> expr
end;

structure Lambda : LExpr = struct
   type 'a Set  = 'a LSet.Set
   datatype expr =  var of string
                  | apply of expr  * expr
                  | abs of  string * expr
   exception Bad of string

   fun toString (var x) = x
     | toString (apply(a,b)) = "(" ^ (toString a) ^ " " ^ (toString b) ^ ")"
     | toString (abs(v,e))   = "L"^ v ^ "." ^ (toString e)


   (* You must implement freeV (see the type above) *)

   fun freeV (var x) = LSet.single x                            (* If there are no apply or abs then all var will be free so return the single set of x*)
    | freeV (apply(a,b)) = LSet.union (freeV(a)) (freeV(b))     (* Split the expr into its function and its body and find the union set of the recursives calls on its function(a) and body (b)*)
    | freeV (abs(v, e)) = LSet.remove v (freeV(e))              (* If there are any abs in the expr then remove all its abstractions/lambdas(v in this case) and recursively call freeV on body e *)


   (* You must implement newName  (see the type above) *)
   fun newName s = let
                      (* Setting variable x to equal to the string y*)
                      (* In the newAux function, I will test to see if val x is a member in set p*)
                      val x = "y"                                                     (* can replace string y with any string *)
                      fun newAux(n: int, p) = if (LSet.member x p)
                                              then let val x = (x ^ Int.toString(n))  (* If x is in p then change x to be xi where i is an interger starting at 1*)
                                                   in if(LSet.member x p)             (* If that new x is a member then recursively call newAux with i+1*)
                                                      then newAux(n+1, p)
                                                      else x                          (* Return x if the new x is not a member*)
                                                   end
                                              else x^Int.toString(0)                                  (* Return original x if it was never a member *)
                    in newAux(1, s)                                                   (* Setting i to 1 and calling the aux function *)
                    end;

(*
 Fill in the five missing functions
*)

    (* Substitution method = [a/x]b where x:string, a:expr, b:expr
    fun subst x a (var b) = if (b = x)                                                                            (* Checks if the variable b is equal to x(meaning it is not bound) if so, then you substitute x with the expr a *)
                            then a                                                                                (* Return the expression a since u are "replacing it" and also var b is not bounded*)
                            else (var b)                                                                          (* If the var b is bounded then you cannt replace it because of the rules of substition so you just return back var b*)
      | subst x a (apply(f,arg)) = apply((subst x a f), (subst x a arg))                                          (* The Case if the expr has a function call, then recurr the substition of its function and its arguments which in here is f and arg*)
      | subst x a (abs(v, b)) =  if (LSet.member v (freeV(a)))                                                    (* The Case if the expr is an abstraction call, then checks if the metavariable(v) is a free variable in the expr a that is replacing x*)
                                 then abs((newName (freeV(a))), subst x a (subst v (var (newName (freeV(a)))) b)) (* When a is a member, it reNames the metavariable and all its bounded variables and then recurses on the new set which has renamed variables*)
                                 else abs(v, subst x a b)
    *)

    (* Substition method with accidental bindings and blind replacements *)                                                                                      (* If there are no free variables in a that match with the metavariable, then you do not need to rename the variables which means u will not mess up any bounded/free variables in the expr already *)
    fun subst x a (var b) = if (b = x)
                          then a
                          else (var b)
     | subst x a (apply(f, arg)) = apply((subst x a f),(subst x a arg))
     | subst x a (abs(v,b)) = abs(v, (subst x a b))

    (* Alpha method where its role is to rename the binders in e to avoid accidental bindings that would occur in a beta reduction *)
    fun alpha (var b) p = (var b)
      | alpha (apply(f,arg)) p = apply((alpha f p), (alpha arg p))
      | alpha (abs(v,b)) p = if (LSet.member v p)
                             then let
                                     val newN = newName p
                                     val newSet = LSet.insert newN p
                                     val newestSet = LSet.union newSet (freeV b)
                                   in
                                      if(LSet.member newN (freeV b))
                                      then abs((newName newestSet), (alpha (subst v (var (newName newestSet)) b) newestSet))
                                      else abs(newN, alpha (subst v (var newN) b) newSet)
                                   end
                             else abs(v, alpha b p)

    (* Normal function that takes an Lambda Expression and determines if it is irreducible or not *)
    fun normal (apply(abs(x,b), G)) = (*let
                                        val e = (abs(x,b))
                                      in
                                        if not (normal G) orelse (normal e)
                                        then false
                                        else true
                                      end *)
                                      false
      | normal (apply(f,arg)) = if not (normal f)
                                then false
                                else (normal arg)
      | normal (abs(v,b)) =  (normal b)
      | normal (var b) = true


    (* Beta function that reduces a lambda expression one step *)
    fun beta e = if (normal e)
                 then e
                 else
                    let
                        fun bAux (apply(abs(v,b), G)) = let
                                                          val e2 = (abs(v,b))
                                                          val freeB = freeV G
                                                          val alphaE2 = alpha b freeB
                                                        in subst v G alphaE2
                                                        end
                         | bAux (apply(f, arg)) = apply(bAux f, bAux arg)
                         | bAux (abs(v,b)) = abs(v,bAux b)
                         | bAux (var b) =    (var b)
                    in bAux e
                    end;


    (* Simp function which takes an expression e and looks if its normal, if it is, it returns e, else it recurses on beta e until e because normal*)
    fun simp e = if (normal e)
                 then e
                 else simp (beta e)



end

open String;;
(*Choix des nombres premiers utilis�s dans les cl�es publiques et priv�es*)

(*PGCD / Greatest Common Divisor*)
let pgcd (a, b) =
  if (a <= 0)||(b <= 0) then
    invalid_arg "pgcd: wrong values"
  else
    let rec pgcdrec (a, b) =
      let r = a mod b in
      
      if r = 0 then
        b
      else
        pgcdrec (b, r)
    in pgcdrec (a, b);;

(*choix de p et q / choice of p and q*)
let rec odd_numbers (p, q) =
  let u = p * (Random.int 500) and v = q * (Random.int 500)
  in
  if (u = 0)||(v = 0)||(pgcd (u, v) <> 1) then
    odd_numbers (p, q)
  else
  if (u mod 2 = 0)||(v mod 2 = 0) then
    odd_numbers (p, q)
      else
        (u, v);;

(*n product*)
let n (p, q) = p * q;;

(*phi*)
let phi (p, q) = (p - 1) * (q - 1);;

(*e exponent*)
let exponent e phi =
  if pgcd (e, phi) = 1 then
    e
  else
    invalid_arg "exponent: e must be prime with phi" ;;

(*inverse d of exponent*)
(*let rec ex_euclid a b =
  if b = 0 then
    a, 1, 0
  else
    match (ex_euclid b (a mod b)) with
      (d, s, t) -> d, t, s - a / b * t;;

(*enter the two wanted numbers/digits in a and b*)           THIS FUNCTION FOUND THE BEZOUT IDENTITY THE DECRYPTION WILL NEED  
match ex_euclid a b with
    (d, t, s) -> Printf.printf "
    (GCD): %d\n 
    (Coefficient for bigger integer): %d\n 
    (Coefficient for smaller integer): %d\n\n" 
                   d s t;;
*)
(*function that decompose a string of each letter of it in a list*)
let reverse list =
  let rec revrec list acc =
    match list with
      []    -> acc
    | e::li -> revrec li (e::acc)
  in revrec list [];;

let decompose word =
  let n = String.length word in
  let rec decorec word list i n =
    match n with
      0 -> reverse list
    | _ -> decorec word ((String.sub word i 1)::list) (i+1) (n-1)
  in decorec word [] 0 n;;

(*alphabet converted in numbers (their rank) from one to twenty-five*)
(*and the function that returns the assiociated digit*)
let alphabet = [("a", 1);("b", 2);("c", 3);("d", 4);("e", 5);("f", 6);("g", 7);("h", 8);("i", 9);("j", 10);("k", 11);("l", 12);("m", 13);("n", 14);("o", 15);("p", 16);("q", 17);("r", 18);("s", 19);("t", 20);("u", 21);("v", 22);("w", 23);("x", 24);("y", 25);("z", 26)];;

let letter_to_digit letter =
  let rec ltdrec letter alphabet =
  match alphabet with
    []               -> invalid_arg "letter_to_digit: not included"
  | (a, b)::alph     -> if letter = a then b
    else
      ltdrec letter alph
  in ltdrec letter alphabet;;

let associated_number list =
  let rec assocrec list assoclist =
    match list with
      []    -> reverse assoclist
    | e::li -> assocrec li ((letter_to_digit e)::assoclist)
                 in assocrec list [];;

(*function that returns a concatenation of each encrypted letter of the given data*)
let rec power e n =
  match n with
    0 -> 1
  | _ -> e * power e (n-1);; 

let rec encrypted list =
  let ios = int_of_string and soi = string_of_int in
  match list with
    []    -> ""
  | k::li -> soi ((power (ios k) e(*exponant*)) mod n(*p times q*)) ^ (encrypted li) ;;

    


        
                    

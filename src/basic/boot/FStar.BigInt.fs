module FStar.BigInt

module Z = FSharp.Compatibility.OCaml.Big_int

type bigint = Z.big_int

let zero = Z.zero_big_int
let one = Z.unit_big_int
let two = Z.big_int_of_string "2"

let succ_big_int = Z.succ_big_int
let pred_big_int = Z.pred_big_int
let minus_big_int = Z.minus_big_int
let abs_big_int = Z.abs_big_int

let add_big_int = Z.add_big_int
let mult_big_int = Z.mult_big_int
let sub_big_int = Z.sub_big_int
let div_big_int = Z.div_big_int
let mod_big_int = Z.mod_big_int

let eq_big_int = Z.eq_big_int
let le_big_int = Z.le_big_int
let lt_big_int = Z.lt_big_int
let ge_big_int = Z.ge_big_int
let gt_big_int = Z.gt_big_int

let square_big_int = Z.sqrt_big_int

let string_of_big_int = Z.string_of_big_int
let big_int_of_string = Z.big_int_of_string





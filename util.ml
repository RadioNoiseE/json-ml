type t = Datatype.stt
open Datatype

open Lexing
open Printf

let print_position outx lexbuf =
  let pos = lexbuf.lex_curr_p in
  fprintf outx "%s:%d:%d" pos.pos_fname pos.pos_lnum (pos.pos_cnum - pos.pos_bol +1)

let parse_with_error lexbuf =
  try Parser.decl Lexer.read lexbuf with
    Lexer.SyntaxError msg ->
     fprintf stderr "%a: %s\n" print_position lexbuf msg;
     `Null

let rec parse_json lexbuf =
  match parse_with_error lexbuf with
  | `Null -> ()
  | _ -> parse_json lexbuf

let parse (json: string) =
  let lexbuf = Lexing.from_string json in
  parse_json lexbuf

let typeof = function
  | `Integer _ -> "int"
  | `Float _ -> "float"
  | `Bool _ -> "bool"
  | `String _ -> "string"
  | `Array _ -> "array"
  | `Object _ -> "object"

exception NotNumericValue
exception NotStringableValue
exception NotArray
exception EmptyArray
exception NotObject
exception EmptyObject

let as_number = function
  | `Int i -> float_of_int i
  | `Float f -> f
  | _ -> raise NotNumericValue

let as_string = function
  | `String s -> s
  | _ -> NotStringableValue

let get_mem n = function
  | `Array ([]) -> raise EmptyArray
  | `Array (a) -> List.nth a n
  | _ -> raise NotArray

let get_child k = function
  | `Object ([]) -> raise EmptyObject
  | `Object (o) -> List.assoc k o
  | _ -> raise NotObject

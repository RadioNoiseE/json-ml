open Json.Util

let json_string = {|{"number" : 42,
 "string" : "yes",
 "list"   : ["for", "sure", 42]}|};;  (* val json_string : string *)
Printf.printf "JSON\n---\n%s\n\n" json_string

let json = parse json_string  (* val json : Json.Datatype.stt *)

let num = json
          |> get_child "number"
          |> as_number;;  (* val num : float *)
Printf.printf "child `number'\n---\n%f\n\n" num

let str = json
          |> get_child "string"
          |> as_string;;  (* val str : string *)
Printf.printf "child `string'\n---\n%s\n\n" str

let mem = json
          |> get_child "list"
          |> get_mem 0
          |> as_string;;  (* val mem : string *)
Printf.printf "child `list' & member `0'\n---%s\n" mem

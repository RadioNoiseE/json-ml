## JSON parser for Objective CAML

### Demo

```ocaml
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
```

### Dependencies

OCaml basic environment. Opam or Dune are not required.

### Build

Refer to the `json.sh` script. By default this is packed into a module, and can be tested with:

```bash
./json.sh # build the JSON module
ocamlopt -c test.ml
ocamlopt json.cmx test.cmx
```

### Copyright

```
MIT License

Copyright (c) 2024 黄京

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

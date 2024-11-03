#!/bin/sh

ocamllex lexer.mll
ocamlyacc parser.mly
ocamlopt -c datatype.ml -for-pack Json
ocamlopt -c parser.mli
ocamlopt -c lexer.ml -for-pack Json
ocamlopt -c parser.ml -for-pack Json
ocamlopt -c util.ml -for-pack Json
ocamlopt -pack -o json.cmx datatype.cmx lexer.cmx parser.cmx util.cmx

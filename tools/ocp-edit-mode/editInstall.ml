(******************************************************************************)
(*                                                                            *)
(*                          TypeRex OCaml Tools                               *)
(*                                                                            *)
(*                               OCamlPro                                     *)
(*                                                                            *)
(*    Copyright 2011-2012 OCamlPro                                            *)
(*    All rights reserved.  See accompanying files for the terms under        *)
(*    which this file is distributed. In doubt, contact us at                 *)
(*    contact@ocamlpro.com (http://www.ocamlpro.com/)                         *)
(*                                                                            *)
(******************************************************************************)

open Subcommands.TYPES

let command_to_execute = "ocp-edit-mode emacs"
let global_config_argument = "-load-global-config"

let emacs_config_file = File.add_basename EditOptions.home_dir ".emacs"

let install_for_emacs () =
  let oc = open_out_gen [ Open_wronly; Open_append; Open_creat; Open_text ]
    0o644 (File.to_string emacs_config_file) in

  Printf.fprintf oc
    "(with-temp-buffer (insert (shell-command-to-string \"%s %s\")) (eval-buffer))\n"
    command_to_execute global_config_argument;
  close_out oc;
  Printf.printf "File %S modified.\n" (File.to_string emacs_config_file);
  exit 0




  let arg_list = [
    "-emacs", Arg.Unit install_for_emacs, " : install in ~/.emacs";
  ]









  let subcmd_spec = {
    subcmd_list = arg_list;
    subcmd_usage = [];
    subcmd_help = [];
  }
  let subcmd_main args = ()
  let subcmd_init () = ()

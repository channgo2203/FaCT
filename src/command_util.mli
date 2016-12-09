(** Compile a constantc program. *)
val compile : Ast.constantc_module -> unit

(* Commands in the compilation process *)
val compile' : Ast.constantc_module -> unit
val run : unit -> unit
val link : unit -> unit
val assemble : unit -> unit
val share : unit -> unit
val clean : unit -> unit
val compile_harness : unit -> unit
val compile_c : string -> (unit -> unit)
val compile_ssl : unit -> unit

val run_command : string -> string array -> unit
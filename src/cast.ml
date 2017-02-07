type ctype =
  | Int32
  | Int16
  | Int8
  | UInt32
  | UInt16
  | UInt8
  | Array of { a_ty:ctype; size:int }
  | BoolMask
[@@deriving show]

and kind =
  | Ref
  | Val

and labeled_type = { ty:ctype; kind:kind }

and binop =
  | Plus
  | Minus
  | Mult
  | GT
  | GTE
  | LT
  | LTE
  | Eq
  | Neq
  | BitAnd
  | BitOr
  | BitXor
  | LeftShift
  | RightShift
[@@deriving show]

and unop =
  | Neg
  | BitNot
[@@deriving show]

and boolmask =
  | TRUE
  | FALSE

and primitive =
  | Number of int
  | ByteArray of int list
  | Mask of boolmask
[@@deriving show]

and expr =
  | VarExp of string
  | ArrExp of string * expr
  | Primitive of primitive
  | UnOp of unop * expr
  | BinOp of binop * expr * expr
  | CallExp of string * expr list
[@@deriving show]

and stm =
  | VarDec of string * labeled_type * expr
  | Assign of string * expr
  | ArrAssign of string * expr * expr
  | For of string * expr * expr * stm list
[@@deriving show]

and fdec = FunctionDec of string * param list * labeled_type * stm list * expr
[@@deriving show]

and param = { name: string; lt: labeled_type }
[@@deriving show]

and cmodule = CModule of fdec list
[@@deriving show]

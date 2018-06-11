module type S = sig
  val x : int
end

let impl : (module S) option ref = ref None

module M : Foo_aux.S = struct
  let x = 42
end

let () = Foo_aux.impl := Some (module M)

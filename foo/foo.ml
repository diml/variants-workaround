include (val (match !Foo_aux.impl with
    | Some x -> x
    | None -> assert false)
    : Foo_aux.S)

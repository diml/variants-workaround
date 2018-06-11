Library variants workaround
---------------------------

It is planned that at some point [dune](https://github.com/ocaml/dune)
will natively support library variants. However, at this point they
are not yet supported.

This repository provides a simple workaround to allow porting code
relying on library variants to Dune. The idea is the following:

The `foo` directory contains a library `foo` defining a module `Foo`
that we want to implement in another library. We declare to dune that
this module has no implementation by writing
`(modules_without_implementation (foo))` in the `jbuild` file of
`foo`. In the `foo` directory, we only write `foo.mli` but no `foo.ml`
file.

The `foo.impl` directory contains one implementation for foo. It
contains `foo.ml` and a copy of `foo.mli`, created dynamically via a
copy rule.

The `test` directory contains an executable linking both `foo` and
`foo.impl`.

Library variants workaround
---------------------------

It is planned that at some point [dune](https://github.com/ocaml/dune)
will natively support library variants. However, at this point they
are not yet supported.

This repository provides a simple workaround to allow porting code
relying on library variants to Dune. The repository is organized as
follow:

- `foo/` contains a library `foo` defining a module `Foo` without
  implementation
- `foo.impl/` contains a library `foo.impl` that provides an
  implementation for `Foo`
- `bar/` contains a library `bar` depending only on `foo`
- `test/` contains an executable depending on `foo` and `bar` and
  `foo.impl`

This is a typical example of usage of library variants. To make this
work it is important to follow these rules:

1. `foo/jbuild` must declare that module `foo` has no implementation
   using a field `(modules_without_implementation (foo))`
2. both `foo/jbuild` and `foo.impl/jbuild` must have `(wrapped false)`
   to ensure the name of the object files match between `foo` and
   `foo.impl`
3. both `foo/jbuild` and `foo.impl/jbuild` must have `(flags
   (:standard -no-keep-locs))` to make sure the cmi files are not
   sensible to the filename
4. `foo.impl/foo.mli` must be a copy of `foo/foo.mli` to make sure the
   cmi files match. This should be ensured via a copy rule

# Patches for hevm and echidna

The symbolic suite (`make verify`) needs these changes on top of the upstream tools. Each
patch is a `git format-patch` file with its own commit message. Each one applies on its own,
and they also apply together in the numbered order.

## hevm (against `main` at 04fe3414)

| Patch | What it does | Needed by |
|---|---|---|
| `0001` Simplify reads of the lowest Solidity-packed storage field | Extends #1114 to the field at offset 0, read with a mask alone (`And (Lit m) (Or ...)`) | `prove_accounting_split` |
| `0002` Split an exponent chosen between two constants | `b ** ITE c x y` with literals becomes `ITE c (b ** x) (b ** y)`, so a packed array element at a conditional index no longer fails with "Cannot encode symbolic exponent" | `prove_squeezable_cant_be_withdrawn`, `prove_squeezable_cant_be_undone` |
| `0003` Fold comparisons of a value with itself rounded down | `x < x - x % c` and its `uintN`-masked form fold to false (Drips' `now < now - now % cycleSecs`) | the same two, together with `0002` |

Each patch adds unit tests and, for `0001` and `0003`, a property that checks the rewrite with
the SMT solver. Run them with `cabal test` or `stack test hevm:test:test --ta '-p /Expr/'`.

## echidna (against `master` at 286449a)

| Patch | What it does |
|---|---|
| `0001` Update hevm to 04fe3414 | Bumps the pin in `stack.yaml` and `flake.nix`. Brings in hash-consing during exploration (#1085, on by default), packed-field reads (#1114) and the SMT buffer equality fix (#1204) |
| `0002` Make the arithmetic abstraction configurable | Adds the `symExecAbstractArith` option (default `true`, as before). The `verify` config of the suite sets it to `false`; without this patch echidna ignores the key and always abstracts |

Once the hevm patches are merged, echidna's pin should move to a commit that includes them.
Until then, build echidna against a local hevm with the three patches applied, by listing that
checkout in `stack.yaml` instead of the git pin:

```yaml
packages:
- .
- /path/to/hevm   # main + patches/hevm/*.patch
```

The `ECHIDNA_HASHCONS` variable exported by the Makefile is for an older local build. With the
hevm bump, hash-consing is already on by default and the variable has no effect.

## Tested

- Each hevm patch alone and all three together pass hevm's `Expr` tests (`0001` alone: all 476).
- echidna `master` with both echidna patches builds against hevm `main` with the three hevm
  patches, and that build verifies `prove_squeezable_cant_be_withdrawn` (needs `0002` and `0003`),
  `prove_split_value_conservation` and `prove_squeeze_fuzzed_history_no_revert`.

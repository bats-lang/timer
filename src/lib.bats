(* timer -- promise-based timers and process control *)

#include "share/atspre_staload.hats"

#use promise as P
#use wasm.bats-packages.dev/bridge as B

#pub fun set
  (delay_ms: int): $P.promise(int, $P.Pending)

#pub fun exit(): void

implement set(delay_ms) = let
  val @(p, r) = $P.create<int>()
  val id = $P.stash(r)
  val () = $B.timer_set(delay_ms, id)
in p end

implement exit() = $B.exit()

fn _test_set(): void = let
  val p = set(100)
  val () = $P.discard<int>(p)
in () end

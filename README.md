# timer

Promise-based timers and process control for bats.

## API

```
#use wasm.bats-packages.dev/timer as T
#use promise as P

(* Set a timer that resolves after delay_ms milliseconds *)
$T.set(delay_ms: int) : promise(int, Pending)

(* Exit the process *)
$T.exit() : void
```

`set` returns a promise that resolves when the host fires the timer.
The resolved value is an integer status (typically 0).

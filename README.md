# Wasm vs JS Interaction Benchmark

This project benchmarks the performance difference between direct JavaScript DOM manipulation and WebAssembly (Wasm) calls that route back to JavaScript.
It isolates the cost of crossing the language boundary (the "trampoline") versus the cost of the actual rendering work.

## Run locally

To run locally ensure that you have installed:

- Python 3: for `http.server`
- [wabt](https://github.com/WebAssembly/wabt): for `wat2wasm` (compiling the WebAssembly text format)

> **Note:** `wat2wasm` is not strictly necessary if you only want to make superficial changes to `experiment/index.html` and use the existing `.wasm` binary.

To compile the Wasm and start the local server:

```sh
$ ./run.sh
```
## Experiment

This benchmark runs two distinct tests across exponentially increasing iterations (from 10 to 10,000,000) to demonstrate when WebAssembly overhead actually matters.

### A. The "Trampoline" Test (Pure Overhead)

- What it does: Calls a function that does absolutely nothing.
- Goal: Measure the raw cost of the "context switch", i.e., jumping from the Wasm engine to the JavaScript engine and back.
- Result: Wasm is typically 2x–3x slower. This proves that the call between languages is expensive when the task itself is trivial.

### B. The "Real World" Test (DOM Update)

- What it does: Updates the text of a visible HTML <div> on every iteration.
- Goal: See if the Wasm overhead implies a performance hit during heavy rendering tasks.
- Result: My results show that performance is nearly identical. The browser's layout and painting engine is so slow (the true bottleneck) that the tiny cost of the Wasm boundary becomes statistically irrelevant.

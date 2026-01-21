#!/bin/bash

wat2wasm experiment.wat -o experiment.wasm

python -m http.server

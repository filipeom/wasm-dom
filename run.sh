#!/bin/bash

wat2wasm experiment/experiment.wat -o experiment/experiment.wasm

python -m http.server -d experiment/

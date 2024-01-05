#!/bin/bash


set -x
rm -rf output; mkdir output
for oimodel in \
    ./openai/base.en.pt \
    ./openai/base.pt \
    ./openai/tiny.en.pt \
    ./openai/tiny.pt \
    ./openai/small.en.pt \
    ./openai/small.pt \
    ./openai/medium.en.pt \
    ./openai/medium.pt \
    ./openai/large-v1.pt \
    ./openai/large-v2.pt \
    ./openai/large-v3.pt \
    ; do

    model=$(basename "$oimodel" | sed 's/.pt$//')
    python3 ../convert-pt-to-ggml.py \
        "$oimodel" \
        ~/sb/whisper \
        ./output
    mv output/ggml-model.bin output/ggml-$model.bin
done



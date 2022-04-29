#!/bin/bash
set -euxo pipefail

# This won't be a static site
# swift package generate-documentation

TARGET_NAME=SlothCreator
OUTPUT_DIR=docs
# swift package --allow-writing-to-directory $OUTPUT_DIR \ 
#     generate-documentation \
#     --target $TARGET_NAME \
#     --disable-indexing \
#     --output-path $OUTPUT_DIR \
#     --transform-for-static-hosting

git clean -fx build
swift package --allow-writing-to-directory $OUTPUT_DIR \
    generate-documentation \
    --target $TARGET_NAME \
    --disable-indexing \
    --output-path $OUTPUT_DIR \
    --transform-for-static-hosting

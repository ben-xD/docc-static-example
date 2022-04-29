#!/bin/bash
set -euxo pipefail

# This won't be a static site
# swift package generate-documentation

TARGET_NAME=SlothCreator
OUTPUT_DIR=docs
git clean -fx build
# Build for root path: eg http://localhost:8000/documentation/SlothCreator
# This is useful if you have a domain/subdomain specifically for this documentation
# swift package --allow-writing-to-directory $OUTPUT_DIR \
#     generate-documentation \
#     --target $TARGET_NAME \
#     --disable-indexing \
#     --output-path $OUTPUT_DIR \
#     --transform-for-static-hosting


# Build for specified path: eg http://localhost:8000/docc-static-example/documentation/SlothCreator
# This is useful for github pages
WEB_PATH=/docc-static-example
swift package --allow-writing-to-directory $OUTPUT_DIR \
    generate-documentation \
    --target $TARGET_NAME \
    --disable-indexing \
    --output-path $OUTPUT_DIR \
    --transform-for-static-hosting \
    --hosting-base-path $WEB_PATH

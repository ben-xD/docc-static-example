#!/bin/bash
set -euxo pipefail

# swift package generate-documentation won't generate a useful static site. So we have more complicated commands instead:

TARGET_NAME=SlothCreator
rm -rf docs
OUTPUT_DIR=docs
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

#!/bin/bash

set -e

# Parameters from the Action inputs
BASE_URL="${{ inputs.base_url }}"
REPO_URL="${{ inputs.repository }}"
RELEASE_TAG="${{ inputs.release_tag }}"

# If the tag contains '/', replace the last '/' with '@'
if [[ "$RELEASE_TAG" == *"/"* ]]; then
  FORMATTED_TAG="/${RELEASE_TAG%/*}@${RELEASE_TAG##*/}"
else
  FORMATTED_TAG="@${RELEASE_TAG}"
fi

# Construct the full URL
FULL_URL="${BASE_URL}/${REPO_URL}${FORMATTED_TAG}"
echo "Sending POST request to $FULL_URL"

# Send the POST request
curl -X POST "$FULL_URL" --fail || echo "Failed to notify pkg.go.dev"

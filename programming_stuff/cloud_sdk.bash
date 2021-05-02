#!/usr/bin/env bash
set -e

source ./utils.bash
echo -e "\ninstall cloud sdk"

: '
- Google Cloud Platform SDK
'

check gcloud || \
(
  echo -e "\ninstall google cloud sdk" && \
  echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
  sudo apt-get install apt-transport-https ca-certificates gnupg -y && \
  curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - && \
  sudo apt-get update && sudo apt-get install google-cloud-sdk -y && \
  echo "google cloud sdk was installed"
)
# to start work with sdk run - `gcloud init`
# more here - https://cloud.google.com/sdk/docs/quickstart

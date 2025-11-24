#!/bin/bash

# Display current kubectl context
KUBE_CONTEXT=$(kubectl config current-context 2>/dev/null || echo "none")

# Display current GCP project
GCP_PROJECT=$(gcloud config get-value project 2>/dev/null || echo "none")

# Display current git branch
GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "")

# Build status line
if [ -n "$GIT_BRANCH" ]; then
  echo "k8s:$KUBE_CONTEXT | gcp:$GCP_PROJECT | git:$GIT_BRANCH"
else
  echo "k8s:$KUBE_CONTEXT | gcp:$GCP_PROJECT"
fi

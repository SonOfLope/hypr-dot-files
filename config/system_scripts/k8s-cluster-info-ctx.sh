#!/bin/bash

context=$(kubectl config current-context)
namespace=$(kubectl config view --minify | grep namespace | awk '{print $2}')

echo "☸ $context/$namespace"

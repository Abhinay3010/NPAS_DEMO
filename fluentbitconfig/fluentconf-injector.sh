#!/bin/bash

SELECTOR=$1

echo "Injecting Fluent Bit configs..."

apps=$(yq '.applications[].name' $SELECTOR)

for app in $apps; do
  echo "Injecting FluentBit config for $app"

  kubectl create configmap fluentbit-$app \
    --from-file=fluentbitconfig/$app/fluent-bit.conf \
    -n npas-applications \
    --dry-run=client -o yaml | kubectl apply -f -
done

echo "Fluent Bit injection complete"

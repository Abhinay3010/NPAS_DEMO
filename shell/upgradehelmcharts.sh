#!/bin/bash

SELECTOR=$1

echo "Deploying applications via Helm..."

apps=$(yq '.applications[].name' $SELECTOR)

for app in $apps; do
  namespace=$(yq ".applications[] | select(.name==\"$app\") | .namespace" $SELECTOR)
  chart=$(yq ".applications[] | select(.name==\"$app\") | .chart" $SELECTOR)
  values=$(yq ".applications[] | select(.name==\"$app\") | .values" $SELECTOR)

  echo "Deploying $app into $namespace"

  helm upgrade --install $app $chart \
    -n $namespace \
    -f $values \
    --create-namespace
done

echo "Application deployment completed"

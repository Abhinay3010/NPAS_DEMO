#!/bin/bash

echo "Deploying VPN-less ingress..."

kubectl apply -f - <<EOF
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: npas-vpnless
  namespace: npas-applications
spec:
  rules:
  - host: demo.npas.local
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: frontend-app
            port:
              number: 80
EOF

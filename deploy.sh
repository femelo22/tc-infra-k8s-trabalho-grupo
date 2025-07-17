#!/bin/bash

set -e

echo "🧼 Aplicando manifestos do Kubernetes..."

# 1. Namespace (precisa ser criado primeiro)
echo "⎈ Aplicando namespace..."
kubectl apply -f namespace.yaml

# 2. Secrets e ConfigMap
echo "🔐 Aplicando secrets e configmaps..."
kubectl apply -f envs/secrets.yml
kubectl apply -f envs/configmap.yaml

# 3. MySQL (PVC → Deployment → Service)
echo "🛢️ Aplicando MySQL (PVC, Deployment e Service)..."
kubectl apply -f mysql/mysql-pvc.yaml
kubectl apply -f mysql/mysql-deployment.yaml
kubectl apply -f mysql/mysql-service.yaml

# 4. API Core (Deployment e Service)
echo "🚀 Aplicando API Core..."
kubectl apply -f api-core/app-deployment.yaml
kubectl apply -f api-core/app-service.yaml

# 5. Webhook Payment
echo "💳 Aplicando Webhook Payment..."
kubectl apply -f webhook-payment/wh-deployment.yaml
kubectl apply -f webhook-payment/wh-service.yaml

echo "✅ Todos os recursos foram aplicados com sucesso!"
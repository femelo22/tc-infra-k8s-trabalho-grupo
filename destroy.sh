#!/bin/bash

set -e

echo "🧼 Deletando recursos do Kubernetes..."

# 1. Webhook Payment
echo "💳 Removendo Webhook Payment..."
kubectl delete -f webhook-payment/wh-service.yaml --ignore-not-found
kubectl delete -f webhook-payment/wh-deployment.yaml --ignore-not-found

# 2. API Core
echo "🚀 Removendo API Core..."
kubectl delete -f api-core/app-service.yaml --ignore-not-found
kubectl delete -f api-core/app-deployment.yaml --ignore-not-found

# 3. MySQL (Service → Deployment → PVC)
echo "🛢️ Removendo MySQL..."
kubectl delete -f mysql/mysql-service.yaml --ignore-not-found
kubectl delete -f mysql/mysql-deployment.yaml --ignore-not-found
kubectl delete -f mysql/mysql-pvc.yaml --ignore-not-found

# 4. Configs (Secrets e ConfigMap)
echo "🔐 Removendo Secrets e ConfigMaps..."
kubectl delete -f envs/secrets.yml --ignore-not-found
kubectl delete -f envs/configmap.yaml --ignore-not-found

# 5. Namespace (por último)
echo "⎈ Removendo Namespace..."
kubectl delete -f namespace.yaml --ignore-not-found

echo "✅ Todos os recursos foram removidos com sucesso!"
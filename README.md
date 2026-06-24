# DevOps Platform Project

Cloud-native automation platform built from scratch to showcase Platform Engineering practices: Infrastructure as Code, CI/CD, orchestrated containers, and observability — deployed on Microsoft Azure.

## Stack

| Category        | Tools                                |
|-----------------|--------------------------------------|
| IaC             | Terraform                            |
| CI/CD           | GitHub Actions                       |
| Containers      | Docker, Kubernetes (AKS), Helm       |
| Observability   | Prometheus, Grafana                  |
| Cloud           | Microsoft Azure                      |

## Architecture

\`\`\`
GitHub Actions (CI/CD)
        |
        v
  Build & Push image
        |
        v
Azure Container Registry (ACR)
        |
        v
Azure Kubernetes Service (AKS) <--- Helm chart deploy
        |
        v
  Prometheus + Grafana (observability)
\`\`\`

## How to run locally

### Prerequisites

- Terraform >= 1.6
- Azure CLI autenticado (\`az login\`)
- Docker Desktop
- kubectl

### Provisioning the infrastructure

\`\`\`bash
cd terraform/environments/dev
terraform init
terraform plan
terraform apply
\`\`\`

### Destroying the infrastructure (avoiding costs)

\`\`\`bash
terraform destroy
\`\`\`

## Project Status

- [x] Repository structure
- [x] Terraform: Resource Group + Azure Container Registry
- [x] Terraform: AKS (Azure Kubernetes Service)
- [x] Containerized application (multi-stage Docker build, non-root user, health/readiness probes)
- [x] Helm chart — deployed and verified end-to-end on AKS
- [x] CI/CD pipeline with GitHub Actions (OIDC auth, az acr build, helm upgrade)
- [x] Observability with Prometheus + Grafana (kube-prometheus-stack, live pod metrics)

## Author

Felipe Daher de Queiroz — Cloud Infrastructure & DevOps Engineer

EOF
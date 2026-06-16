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

## Project status

- [x] Estrutura do repositório
- [x] Terraform: Resource Group + Azure Container Registry
- [ ] Terraform: AKS (Azure Kubernetes Service)
- [ ] Aplicação containerizada
- [ ] Pipeline CI/CD com GitHub Actions
- [ ] Deploy via Helm no AKS
- [ ] Observabilidade com Prometheus + Grafana

## Author

Felipe Daher de Queiroz — Cloud Infrastructure & Information Security Specialist
EOF
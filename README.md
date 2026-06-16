# DevOps Platform Project

Plataforma de automação cloud-native construída do zero para demonstrar práticas de Platform Engineering: Infrastructure as Code, CI/CD, containers orquestrados e observabilidade — provisionada no Microsoft Azure.

## Stack

| Categoria       | Ferramenta                          |
|-----------------|--------------------------------------|
| IaC             | Terraform                            |
| CI/CD           | GitHub Actions                       |
| Containers      | Docker, Kubernetes (AKS), Helm       |
| Observabilidade | Prometheus, Grafana                  |
| Cloud           | Microsoft Azure                      |

## Arquitetura

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

## Como rodar localmente

### Pré-requisitos

- Terraform >= 1.6
- Azure CLI autenticado (\`az login\`)
- Docker Desktop
- kubectl

### Provisionando a infraestrutura

\`\`\`bash
cd terraform/environments/dev
terraform init
terraform plan
terraform apply
\`\`\`

### Destruindo a infraestrutura (evitar custos)

\`\`\`bash
terraform destroy
\`\`\`

## Status do projeto

- [x] Estrutura do repositório
- [x] Terraform: Resource Group + Azure Container Registry
- [ ] Terraform: AKS (Azure Kubernetes Service)
- [ ] Aplicação containerizada
- [ ] Pipeline CI/CD com GitHub Actions
- [ ] Deploy via Helm no AKS
- [ ] Observabilidade com Prometheus + Grafana

## Autor

Felipe Daher de Queiroz — Cloud Infrastructure & Information Security Specialist
EOF
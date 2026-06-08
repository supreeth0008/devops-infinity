# DevOps Infinity Pipeline

A production-grade DevOps project built progressively from a basic CI/CD pipeline to a full enterprise-level platform.

## Phase 1 - Foundation

### Stack

| Component | Technology |
|---|---|
| Application | Python Flask |
| Containerization | Docker |
| CI/CD | GitHub Actions |
| Infrastructure | Terraform |
| Cloud | AWS EC2, ECR, IAM, VPC |
| Region | ap-south-1 Mumbai |

### Infrastructure

- EC2 instance t3.micro running Ubuntu 22.04
- ECR repository for Docker images
- IAM role with ECR read access attached to EC2
- Security group allowing ports 22, 80, 5000
- SSH key pair for secure access

### CI/CD Pipeline Steps

1. Checkout code
2. Configure AWS credentials
3. Login to Amazon ECR
4. Build and push Docker image
5. Deploy to EC2 via SSH
6. Verify deployment via health endpoint

### Endpoints

| Endpoint | Description |
|---|---|
| / | Application home page |
| /health | Health check endpoint |

### Roadmap

| Phase | Status | Description |
|---|---|---|
| 1 | Complete | Docker, Terraform, GitHub Actions, AWS |
| 2 | Upcoming | Kubernetes, Prometheus, Grafana, Loki |
| 3 | Upcoming | ArgoCD, DevSecOps, Canary deployments |
| 4 | Upcoming | Tracing, Chaos Engineering, SRE, Vault |

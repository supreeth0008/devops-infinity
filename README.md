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

## Phase 2 - Intermediate

### Overview

Application deployed to Civo Kubernetes cluster with auto-scaling, monitored via Prometheus remote write to Grafana Cloud.

### Stack

| Component | Technology |
|---|---|
| Container Orchestration | Kubernetes (Civo K3s) |
| Monitoring | Prometheus + Grafana Cloud |
| Auto-scaling | Horizontal Pod Autoscaler |
| Load Balancer | Civo Cloud LoadBalancer |
| Metrics Storage | Grafana Cloud (free tier) |

### Kubernetes Resources

- Deployment with 2 replicas and resource limits
- LoadBalancer service exposing port 80
- HPA scaling from 2 to 5 pods at 70% CPU
- ECR image pull secret for private registry access
- Liveness and readiness probes on /health endpoint

### Monitoring

- Prometheus scrapes all cluster metrics every 15 seconds
- Remote write ships metrics to Grafana Cloud
- Three dashboards imported: K8S Dashboard, Node Overview, Pods Overview
- Metrics retained for 24 hours locally

### Live Endpoints

| Endpoint | URL |
|---|---|
| Application | http://74.220.21.89 |
| Health Check | http://74.220.21.89/health |
| Grafana Cloud | https://savvycrocus1079.grafana.net |

### Roadmap

| Phase | Status | Description |
|---|---|---|
| 1 | Complete | Docker, Terraform, GitHub Actions, AWS |
| 2 | Complete | Kubernetes, Prometheus, Grafana Cloud, HPA |
| 3 | Upcoming | ArgoCD, DevSecOps, Canary deployments |
| 4 | Upcoming | Tracing, Chaos Engineering, SRE, Vault |

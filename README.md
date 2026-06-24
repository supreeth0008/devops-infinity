# DevOps Infinity

A production-grade DevOps platform I built progressively from a basic CI/CD pipeline to a full enterprise-level stack. Not a tutorial — this is a real, running Kubernetes cluster with GitOps, observability, security scanning, and chaos engineering.

---

## Platform Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                        GitHub                              │
│  (Flask App + Dockerfile + Terraform + K8s Manifests)      │
└────────────────────┬────────────────────────────────────────┘
                     │ GitHub Actions
                     ▼
┌─────────────────────────────────────────────────────────────┐
│                    CI/CD Pipeline                            │
│  Build → SonarCloud → Trivy Scan → Docker Push → Deploy    │
└────────────────────┬────────────────────────────────────────┘
                     │
         ┌──────────┴──────────┐
         ▼                     ▼
   ┌──────────┐          ┌──────────┐
   │   AWS    │          │  Civo    │
   │   EC2    │          │  K3s     │
   │ (Phase 1)│          │(Phase 2+)│
   └──────────┘          └────┬─────┘
                              │
                ┌─────────────┼─────────────┐
                ▼             ▼             ▼
          ┌────────┐   ┌──────────┐   ┌──────────┐
          │ ArgoCD │   │Prometheus│   │ Vault    │
          │(GitOps)│   │ + Grafana│   │ Secrets  │
          └────────┘   └──────────┘   └──────────┘
                │
                ▼
          ┌────────────┐
          │ArgoRollouts│
          │ (Canary)   │
          └────────────┘
```

---

## Phase 1 — Foundation

**Stack:** Python Flask, Docker, GitHub Actions, Terraform, AWS (EC2, ECR, IAM, VPC)

- Containerized Flask application with `/health` endpoint
- Terraform infrastructure: EC2, ECR, IAM roles, Security Groups, VPC
- GitHub Actions pipeline: build → SonarCloud → Trivy → push to ECR → deploy to EC2
- Region: ap-south-1 (Mumbai)

## Phase 2 — Intermediate

**Stack:** Kubernetes (Civo K3s), Prometheus, Grafana Cloud, HPA, LoadBalancer

- Migrated from EC2 to Kubernetes cluster on Civo K3s
- Prometheus metrics collection with remote write to Grafana Cloud
- Horizontal Pod Autoscaler scaling 2→5 pods at 70% CPU
- Civo Cloud LoadBalancer exposing port 80
- ECR image pull secrets for private registry access
- Liveness and readiness probes on `/health` endpoint

## Phase 3 — Advanced

**Stack:** ArgoCD, Argo Rollouts, SonarCloud, Trivy, Canary Deployments

- GitOps with ArgoCD v3.4.3 for declarative deployment management
- SonarCloud code quality gates in CI pipeline
- Trivy container security scanning
- Argo Rollouts v1.9.0 for progressive delivery
- Canary strategy: 20% → 50% → 100% traffic shift

## Phase 4 — FAANG Level

**Stack:** Jaeger, OpenTelemetry, LitmusChaos, HashiCorp Vault

- Distributed tracing with Jaeger all-in-one
- OpenTelemetry Collector for vendor-neutral telemetry
- LitmusChaos for chaos engineering experiments (pod kill, network latency)
- HashiCorp Vault v2.0.2 initialized and unsealed for dynamic secrets

---

## Live Screenshots

> These are real screenshots from my running cluster, not mockups.

**GitHub Actions Pipeline**
```
Build → SonarCloud scan → Trivy scan → Docker build → Push to ECR → Deploy to EC2
```

**ArgoCD Application**
- Status: Healthy, Synced
- Auto-sync enabled, synced to HEAD
- Author: supreeth0008

**Kubernetes Cluster**
- Namespaces: argo-rollouts, argocd, default, devops-infinity, kube-system, litmus, monitoring, observability, vault
- All core services running and healthy

**Resource Monitoring**
- `kubectl top nodes` and `kubectl top pods` showing live resource usage
- HPA maintaining 2 replicas at low CPU, scaling up to 5 at 70%

**Health Checks**
- EC2: `{"status": "healthy", "version": "18"}`
- Kubernetes: `{"status": "healthy", "version": "2.0.0"}`

**Grafana Cloud Dashboards**
- Kubernetes All-in-one Cluster Monitoring K8s
- Alert Groups Insights
- Incident Insights
- K8S Dashboards with Prometheus metrics

**HashiCorp Vault**
- Initialized: true
- Sealed: false
- Version: 2.0.2
- Ready for dynamic secrets management

---

## Repository Structure

```
devops-infinity/
├── terraform/          # AWS infrastructure (EC2, ECR, IAM, VPC, SG)
├── app/                # Python Flask application
├── kubernetes/         # K8s manifests, ArgoCD apps, Rollouts
├── .github/workflows/  # GitHub Actions CI/CD pipeline
├── scripts/            # Automation and helper scripts
└── docker/             # Dockerfile and compose configs
```

---

Built by [Supreeth Bhat](https://github.com/supreeth0008) — this is what I do when I am not studying.

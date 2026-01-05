# 🚀 GitOps-Based CI/CD Platform on AWS EKS

## 📌 Overview

This project implements a **GitOps-based CI/CD platform** for deploying and operating cloud-native applications on **AWS EKS**.  
It demonstrates how **CI pipelines**, **GitOps-driven continuous deployment**, and **observability** can be combined to deliver **reliable, scalable, and auditable Kubernetes deployments**.

The platform follows modern DevOps best practices:

- Infrastructure and application state defined as code
- Declarative deployments using GitOps
- Automated CI pipelines
- Real-time monitoring and visibility

---

## 🏗️ Architecture

**High-level flow:**

1. Developers push code changes to GitHub
2. **CI pipeline** builds and validates Docker images
3. Images are pushed to a container registry
4. Kubernetes manifests / Helm values are updated in Git
5. **Argo CD** continuously syncs desired state to AWS EKS
6. **Prometheus & Grafana** monitor applications, deployments, and cluster health

---

## 🧩 Components

### 🔹 Continuous Integration (CI)

- Automated container image builds
- Validation of application and Kubernetes manifests
- GitHub Actions–based workflows
- Ensures only validated artifacts reach the deployment stage

### 🔹 Continuous Deployment (CD – GitOps)

- Declarative Kubernetes deployments using **Argo CD**
- Git as the single source of truth
- Automatic synchronization between Git and cluster state
- Rollbacks handled via Git history

### 🔹 Kubernetes Platform

- Amazon **EKS** as the managed Kubernetes control plane
- Workloads deployed using Kubernetes manifests and Helm
- Supports rolling updates and zero-downtime deployments

### 🔹 Observability & Monitoring

- **Prometheus** for metrics collection
- **Grafana** dashboards for:
  - Application health
  - Deployment status
  - Cluster resource utilization
- Monitoring integrated with Argo CD for GitOps visibility

---

## 🛠️ Tech Stack

- **Cloud:** AWS (EKS)
- **Containers & Orchestration:** Docker, Kubernetes
- **CI/CD:** GitHub Actions
- **GitOps:** Argo CD
- **Deployment Management:** Helm
- **Monitoring:** Prometheus, Grafana
- **Infrastructure as Code (optional):** Terraform

---

## ✅ Key Features

- GitOps-based deployment model using Argo CD
- Automated CI pipelines for containerized applications
- Declarative, version-controlled Kubernetes manifests
- Zero-downtime deployment strategies
- Centralized observability with Prometheus and Grafana
- Scalable and production-ready EKS-based architecture

---

## 📈 Learning Outcomes

- Practical implementation of **GitOps principles**
- Real-world CI/CD automation for Kubernetes
- Hands-on experience with **Argo CD**, **EKS**, and cloud-native monitoring
- Improved understanding of platform reliability and deployment automation

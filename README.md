# terraform-hcp-demo

A simple Terraform project demonstrating HCP Terraform (Terraform Cloud) with VCS-driven workflow — deploys a Resource Group and Storage Account on Azure, with state managed remotely by HCP.

---

## 📋 Overview

This project demonstrates how to use HCP Terraform with a GitHub VCS integration. Pushing to the repository automatically triggers a plan in HCP Terraform. State is managed remotely by HCP — no local state files, no backend configuration needed.

---

## 🏗️ Architecture

```
GitHub Push
      ↓
HCP Terraform (VCS Trigger)
      ↓
Plan → Approve → Apply
      ↓
Resource Group
      ↓
Storage Account + Blob Container
```

---

## ✨ Features

- ✅ HCP Terraform VCS-driven workflow — push to deploy
- ✅ Remote state managed by HCP automatically
- ✅ Variables managed via HCP UI — no tfvars committed
- ✅ Input validation on key variables
- ✅ Private blob container — no public access

---

## 📁 Project Structure

```
terraform-hcp-demo/
├── provider.tf      # Terraform cloud block + AzureRM provider
├── main.tf          # Resource Group + Storage Account + Container
├── variables.tf     # Variable declarations with validation
└── outputs.tf       # Resource outputs
```

---

## ✅ Prerequisites

- HCP Terraform account — [app.terraform.io](https://app.terraform.io)
- GitHub connected to HCP Terraform
- Azure Service Principal with Contributor role
- Terraform >= 1.3.0

---

## 🔧 HCP Terraform Setup

### 1. Create Organization

```
app.terraform.io → New Organization
```

### 2. Connect GitHub

```
Settings → Version Control → Connect GitHub
```

### 3. Create Workspace

```
New Workspace
    → Version Control Workflow
        → GitHub
            → Select this repo
```

### 4. Set Terraform Variables

```
Workspace → Variables → Add variable (Terraform variable)

resource_group_name  = "rg-<project>-<env>-<region>"
location             = "japaneast"
storage_account_name = "str<project><env><region>"
container_name       = "cnt-<project>-<env>-<region>"
tags                 = {
  environment = "<dev|prod>"
  project     = "<project-name>"
  owner       = "<your-name>"
}  ← HCL tick
```

### 5. Set Azure Credentials

```
Workspace → Variables → Add variable (Environment variable)

ARM_CLIENT_ID       = <service principal client id>
ARM_CLIENT_SECRET   = <service principal secret>    ← Sensitive ✅
ARM_SUBSCRIPTION_ID = <your subscription id>
ARM_TENANT_ID       = <your tenant id>
```

---

## 🚀 Usage

### ▶️ Deploy

```bash
# Push to GitHub → HCP auto triggers plan
git add .
git commit -m "feat: deploy RG and Storage Account"
git push
```

Then in HCP:
```
Workspace → Runs → Confirm & Apply
```

### 🗑️ Destroy

```
HCP Dashboard
    → Workspace → terraform-hcp-demo
        → Settings
            → Destruction and Deletion
                → Queue Destroy Plan
                    → Confirm & Apply
```

---

## 💡 Key Concepts

| Concept | Where |
|---------|-------|
| HCP VCS workflow | Push to GitHub → auto plan |
| Remote state | Managed by HCP automatically |
| Variables via UI | No tfvars committed |
| Azure Service Principal | Environment variables in HCP |
| Input validation | `variables.tf` |

---

## 🛠️ Tech Stack

- Terraform ~> 1.3.0
- AzureRM Provider ~> 4.0
- HCP Terraform (Terraform Cloud)
- Azure (japaneast)
- GitHub VCS

---

## 👤 Author

**MD SHARIF MULLA MAHIN**  
Lead Engineer  
Tokyo, Japan 🇯🇵

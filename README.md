# **Homelab Config**

Configuration and infrastructure files for my personal homelab.

The main purpose of this repository is to keep my homelab configuration version-controlled, reproducible, and organized while I learn and practice DevOps technologies.

This is a real working homelab, so the repository contains configurations that are actually used on my own infrastructure, rather than only example projects.

## **Repository structure**

```text
.
├── docker/
│   ├── coding/
│   │   └── gitea/
│   ├── database/
│   │   ├── mariadb/
│   │   ├── pgadmin/
│   │   ├── phpmyadmin/
│   │   └── postgresql/
│   ├── docker/
│   │   └── portainer/
│   └── monitoring/
│       ├── alertmanager/
│       ├── blackbox-exporter/
│       ├── cadvisor/
│       ├── dozzle/
│       ├── grafana/
│       ├── heimdall/
│       ├── loki/
│       ├── nodeexporter/
│       ├── prometheus/
│       └── uptimekuma/
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── ...
│
└── ansible/
    ├── group_vars/
    ├── host_vars/
    ├── inventory.ini
    ├── playbooks/
    ├── roles/
    └── ansible.cfg
```

## **Docker**

The `docker/` directory contains Docker Compose configurations created and tested on my homelab.

The purpose of this environment was to learn and practice:

- Docker fundamentals
- Docker Compose
- containers and images
- networks
- volumes and persistent data
- service dependencies
- container management
- monitoring and logging of containers

The Compose files are based on services that are actually running in my homelab. They were created and modified while learning how Docker and Docker Compose work, rather than being copied from a single predefined deployment.

The environment is intentionally experimental. Configurations may change as I learn better ways to organize, deploy and maintain the services.

### **Databases**

- MariaDB
- PostgreSQL
- phpMyAdmin
- pgAdmin

### **Monitoring**

The monitoring stack is based mainly on the Prometheus ecosystem:

- Prometheus
- Grafana
- Alertmanager
- Node Exporter
- cAdvisor
- Blackbox Exporter
- Loki
- Promtail

Additional tools are used for container monitoring and administration:

- Uptime Kuma
- Dozzle
- Portainer

### **Development**

- Gitea

## **Monitoring**

The monitoring setup is used as a practical learning environment for:

- metrics collection with Prometheus
- visualization with Grafana
- alerting with Alertmanager
- HTTP/ICMP/TCP probing with Blackbox Exporter
- container metrics with cAdvisor
- host metrics with Node Exporter
- log collection with Promtail
- log storage and querying with Loki
- notifications through Slack

The goal is not only to run these services, but to understand how the individual components work together.

## **Terraform**

Terraform is used to provision and manage virtual machines on the Proxmox homelab.

The current Terraform configuration creates a virtual machine from a Proxmox template and configures its basic resources and network settings.

The goal is to make infrastructure provisioning reproducible rather than creating and configuring virtual machines manually.

## **Ansible**

Ansible is used for configuration management and server automation.

The current Ansible setup includes:

- inventory and host/group variables
- Ansible roles
- Jinja2 templates
- handlers
- facts
- conditional tasks
- loops
- variable validation with `assert`
- task delegation
- runtime variables with `set_fact`
- Ansible Vault for encrypted secrets

The current role configures an Ubuntu server with Nginx.

The next step is to use Ansible to install and configure Docker and deploy the existing Docker Compose services.

## **Infrastructure**

The homelab is currently running on Proxmox with virtual machines and containers.

The infrastructure automation is being built around:

- **Terraform** — provisioning and managing infrastructure
- **Ansible** — configuration management and automation
- **Docker Compose** — application and service deployment

The long-term goal is to connect these layers into a reproducible workflow:

```text
Terraform
    ↓
Proxmox VM
    ↓
Ansible
    ↓
Docker
    ↓
Docker Compose services
```

## **Goals**

The main goals of this repository are:

1. Keep infrastructure configuration under version control.
2. Learn DevOps tools through a real environment.
3. Make the setup easier to reproduce and maintain.
4. Gradually automate manual tasks.
5. Build a practical DevOps portfolio based on real work.

## **Security**

Secrets and credentials should not be committed to this repository.

Ansible Vault is used for encrypted Ansible variables.

Real credentials, API keys, tokens, passwords and webhook URLs should never be stored in plaintext in Git.

Vault-encrypted files may be stored in the repository, but the Vault password itself must be kept outside Git.

## **Status**

This is an ongoing project.

Docker services are already running in the homelab.

Terraform provisioning is working, and Ansible configuration management is currently being developed.

The next major step is to connect Ansible with the existing Docker Compose configurations and gradually automate the deployment of the homelab services.
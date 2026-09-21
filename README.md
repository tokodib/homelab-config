# Homelab Config

Configuration and infrastructure files for my personal homelab.

The main purpose of this repository is to keep my homelab configuration version-controlled, reproducible, and organized while I learn and practice DevOps technologies.

This is a real working homelab, so the repository contains configurations that are actually used on my own infrastructure, rather than only example projects.

## Repository structure

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
│   └── # planned
│
└── ansible/
    └── # planned
```

## Docker

The `docker/` directory contains Docker Compose configurations created and tested on a dedicated test VM in my homelab.

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

### Databases

* MariaDB
* PostgreSQL
* phpMyAdmin
* pgAdmin

### Monitoring

The monitoring stack is based mainly on the Prometheus ecosystem:

* Prometheus
* Grafana
* Alertmanager
* Node Exporter
* cAdvisor
* Blackbox Exporter
* Loki
* Promtail

Additional tools are used for container monitoring and administration:

* Uptime Kuma
* Dozzle
* Portainer

### Development

* Gitea

## Monitoring

The monitoring setup is used as a practical learning environment for:

* metrics collection with Prometheus
* visualization with Grafana
* alerting with Alertmanager
* HTTP/ICMP/TCP probing with Blackbox Exporter
* container metrics with cAdvisor
* host metrics with Node Exporter
* log collection with Promtail
* log storage and querying with Loki
* notifications through Slack

The goal is not only to run these services, but to understand how the individual components work together.

## Infrastructure

The homelab is currently running on Proxmox with virtual machines and containers.

Infrastructure as Code is planned as the next step:

* **Terraform** — provisioning and managing infrastructure
* **Ansible** — configuration management and automation

These will eventually be added under the `terraform/` and `ansible/` directories.

## Goals

The main goals of this repository are:

1. Keep infrastructure configuration under version control.
2. Learn DevOps tools through a real environment.
3. Make the setup easier to reproduce and maintain.
4. Gradually automate manual tasks.
5. Build a practical DevOps portfolio based on real work.

## Security

Secrets and credentials should not be committed to this repository.

Configuration examples may contain placeholders such as:

```text
PASSWORD
ROOTPASSWORD
WEBHOOK_URL
```

Real credentials, API keys, tokens and webhook URLs should be kept outside Git.

## Status

This is an ongoing project.

The homelab is already running several services, while Terraform and Ansible automation are planned as the next major additions.

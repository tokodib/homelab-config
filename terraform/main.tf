terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "~> 0.66"
    }
  }
}

provider "proxmox" {
  endpoint = var.proxmox_endpoint
  api_token = var.proxmox_api_token
  insecure = true
}

data "proxmox_virtual_environment_nodes" "homelab" {}

output "nodes" {
  value = data.proxmox_virtual_environment_nodes.homelab.names
}

resource "proxmox_virtual_environment_vm" "homelab" {
  vm_id = 111
  name = "homelab-server-01"
  node_name = "axion-pve"
  on_boot = true

  clone {
    vm_id = 9000
    full = true
  }

  initialization {
    user_account {
      username = "automation"
      keys = [trimspace(file("~/.ssh/id_ed25519.pub"))]
    }

    ip_config {
      ipv4 {
        address = "192.168.1.111/24"
        gateway = "192.168.1.1"
      }
    }

    dns {
      servers = ["192.168.1.1"]
    }
  }

  cpu {
    cores = 2
    sockets = 1
  }

  memory {
    dedicated = 6144
  }

  network_device {
    bridge = "vmbr0"
  }

  
}


module "vpc_dev" {
  source = "./vpc"

  env_name       = var.network_name
  zone           = var.default_zone
  v4_cidr_blocks = [var.subnet_cidr]
}

data "template_file" "cloudinit" {
  template = file("${path.module}/cloud-init.yml")

  vars = {
    ssh_public_key = var.vms_ssh_root_key
  }
}

module "marketing_vm" {
  source = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"

  env_name     = "marketing"
  network_id   = module.vpc_dev.network_id
  subnet_zones = [var.default_zone]
  subnet_ids   = [module.vpc_dev.subnet_id]

  instance_name  = "marketing-vm"
  instance_count = 1

  image_family = "ubuntu-2004-lts"

  public_ip   = true
  preemptible = true

  labels = {
    project = "marketing"
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = "1"
  }
}

module "analytics_vm" {
  source = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"

  env_name     = "analytics"
  network_id   = module.vpc_dev.network_id
  subnet_zones = [var.default_zone]
  subnet_ids   = [module.vpc_dev.subnet_id]

  instance_name  = "analytics-vm"
  instance_count = 1

  image_family = "ubuntu-2004-lts"

  public_ip   = true
  preemptible = true

  labels = {
    project = "analytics"
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = "1"
  }
}
locals {
  ssh_public_key = file(pathexpand("~/.ssh/id_ed25519.pub"))
}

data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2204-lts"
}
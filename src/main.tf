module "vpc_dev" {
  source       = "./vpc"
  env_name     = "stage"
  vpc_name     = "stage"
  subnets = [
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
  ]
}
module "vpc" {
  source       = "./vpc"
  env_name     = "develop"
  vpc_zone     = "ru-central1-a"
  vpc_cidr     = ["10.0.1.0/24"]
  vpc_name     = "vpc"
}

module "marketing" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=1.0.0"
  env_name       = var.vm.analytics.env_name
  network_id     = module.vpc.vpc_subnet.name
  subnet_zones   = [module.vpc.vpc_subnet.zone]
  subnet_ids     = [module.vpc.vpc_subnet.id]
  instance_name  = var.vm.analytics.instance_name
  instance_count = var.vm.analytics.instance_count
  image_family   = var.vm.analytics.image_family
  public_ip      = var.vm.analytics.public_ip

   labels = {
    project = "marketing"
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

module "analytics" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=1.0.0"
  env_name       = var.vm.marketing.env_name
  network_id     = module.vpc.vpc_subnet.name
  subnet_zones   = [module.vpc.vpc_subnet.zone]
  subnet_ids     = [module.vpc.vpc_subnet.id]
  instance_name  = var.vm.marketing.instance_name
  instance_count = var.vm.marketing.instance_count
  image_family   = var.vm.marketing.image_family
  public_ip      = var.vm.marketing.public_ip

   labels = {
    project = "analytics"
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

data template_file "cloudinit" {
  template = file("${path.module}/cloud-init.yml")

  vars = {
    username           = var.userdata.username
    ssh_public_key     = file(var.userdata.ssh_public_key)
    packages           = var.packages
  }
}
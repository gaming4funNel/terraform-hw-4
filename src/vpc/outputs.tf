output "vpc_subnet" {
  value = {
    name       = yandex_vpc_subnet.develop.name,
    zone       = yandex_vpc_subnet.develop.zone,
    network_id = yandex_vpc_subnet.develop.network_id,
    cidr       = yandex_vpc_subnet.develop.v4_cidr_blocks
    id         = yandex_vpc_subnet.develop.id
  }
}

output "vpc" {
  value = {
    id       = yandex_vpc_network.develop.id
  }
}
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_analytics"></a> [analytics](#module\_analytics) | git::https://github.com/udjin10/yandex_compute_instance.git | 1.0.0 |
| <a name="module_marketing"></a> [marketing](#module\_marketing) | git::https://github.com/udjin10/yandex_compute_instance.git | 1.0.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./vpc | n/a |
| <a name="module_vpc_dev"></a> [vpc\_dev](#module\_vpc\_dev) | ./vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [template_file.cloudinit](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_id"></a> [cloud\_id](#input\_cloud\_id) | https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id | `string` | n/a | yes |
| <a name="input_default_cidr"></a> [default\_cidr](#input\_default\_cidr) | https://cloud.yandex.ru/docs/vpc/operations/subnet-create | `list(string)` | <pre>[<br>  "10.0.1.0/24"<br>]</pre> | no |
| <a name="input_default_zone"></a> [default\_zone](#input\_default\_zone) | https://cloud.yandex.ru/docs/overview/concepts/geo-scope | `string` | `"ru-central1-a"` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id | `string` | n/a | yes |
| <a name="input_packages"></a> [packages](#input\_packages) | n/a | `string` | `"nginx"` | no |
| <a name="input_token"></a> [token](#input\_token) | OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token | `string` | n/a | yes |
| <a name="input_userdata"></a> [userdata](#input\_userdata) | n/a | `map(string)` | <pre>{<br>  "ssh_public_key": "~/.ssh/id_ed25519.pub",<br>  "username": "ubuntu"<br>}</pre> | no |
| <a name="input_vm"></a> [vm](#input\_vm) | n/a | <pre>map(object({<br>    env_name       = string<br>    subnet_zones   = string<br>    instance_name  = string<br>    instance_count = number<br>    image_family   = string<br>    public_ip      = bool<br>  }))</pre> | <pre>{<br>  "analytics": {<br>    "env_name": "stage",<br>    "image_family": "ubuntu-2004-lts",<br>    "instance_count": 1,<br>    "instance_name": "web",<br>    "public_ip": true,<br>    "subnet_zones": "ru-central1-a"<br>  },<br>  "marketing": {<br>    "env_name": "dev",<br>    "image_family": "ubuntu-2004-lts",<br>    "instance_count": 1,<br>    "instance_name": "web",<br>    "public_ip": true,<br>    "subnet_zones": "ru-central1-a"<br>  }<br>}</pre> | no |
| <a name="input_vm_db_name"></a> [vm\_db\_name](#input\_vm\_db\_name) | example vm\_db\_ prefix | `string` | `"netology-develop-platform-db"` | no |
| <a name="input_vm_web_name"></a> [vm\_web\_name](#input\_vm\_web\_name) | example vm\_web\_ prefix | `string` | `"netology-develop-platform-web"` | no |
| <a name="input_vms_ssh_root_key"></a> [vms\_ssh\_root\_key](#input\_vms\_ssh\_root\_key) | ssh-keygen -t ed25519 | `string` | `"your_ssh_ed25519_key"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC network&subnet name | `string` | `"develop"` | no |

## Outputs

No outputs.

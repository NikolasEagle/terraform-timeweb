# terraform-timeweb

Terraform-конфигурация для управления инфраструктурой в Timeweb Cloud.

## Описание

Данный проект содержит Terraform-конфигурации и модули для автоматизированного создания и управления ресурсами в Timeweb Cloud.

С помощью Terraform можно:

- создавать облачные серверы;
- управлять сетевыми ресурсами;
- автоматизировать развёртывание инфраструктуры;
- хранить инфраструктуру в виде кода (Infrastructure as Code).

## Требования

- Terraform >= 1.3
- Аккаунт Timeweb Cloud
- API Token Timeweb Cloud

## Установка

Клонируйте репозиторий:

```bash
git clone https://github.com/NikolasEagle/terraform-timeweb.git
cd terraform-timeweb
```

Инициализируйте Terraform:

```bash
terraform init
```

## Настройка провайдера

Создайте файл `terraform.tfvars`:

```hcl
twc_token = "YOUR_API_TOKEN"
```

Пример конфигурации провайдера:

```hcl
terraform {
  required_providers {
    timeweb-cloud = {
      source  = "timeweb-cloud/timeweb-cloud"
      version = "~> 1.6"
    }
  }
}

provider "timeweb-cloud" {
  token = var.twc_token
}
```

## Использование

### Проверка конфигурации

```bash
terraform validate
```

### Просмотр плана изменений

```bash
terraform plan
```

### Применение изменений

```bash
terraform apply
```

### Удаление инфраструктуры

```bash
terraform destroy
```

## Структура проекта

```text
.
├── main.tf
├── variables.tf
├── providers.tf
├── domain.tf
├── terraform.tfvars
└── README.md
```

## Полезные ссылки

- Terraform Documentation: https://developer.hashicorp.com/terraform/docs
- Timeweb Cloud Documentation: https://timeweb.cloud/docs
- Terraform Registry (Timeweb Provider): https://registry.terraform.io/providers/timeweb-cloud/timeweb-cloud/latest

## Лицензия

MIT License.
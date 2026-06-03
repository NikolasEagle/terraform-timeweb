variable "twc_token" {
  description = "Timeweb Cloud API token"
  type        = string
  sensitive   = true
}

variable "ipv4_kz" {
    description = "IP VDS KZ"
    type = string
    sensitive = true
}

variable "ipv4_ru" {
    description = "IP VDS RU"
    type = string
    sensitive = true
}
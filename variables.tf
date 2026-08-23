variable "twc_token" {
  description = "Timeweb Cloud API token"
  type        = string
  sensitive   = true
}

variable "ipv4_kz" {
  description = "IP VDS KZ"
  type        = string
  sensitive   = true
}

variable "ipv4_ru" {
  description = "IP VDS RU"
  type        = string
  sensitive   = true
}

variable "ipv4_vpn" {
  description = "IP VDS VPN"
  type        = string
  sensitive   = true
}

variable "domains_kz" {
  description = "List of subdomains for VDS KZ"
  type        = list(string)
  default = [
    "element",
    "admin.element",
    "grafana",
    "mas",
    "matrix",
    "mousebook",
    "moviecat",
    "mozart",
    "mrtc",
    "synapse"
  ]
}

variable "domains_ru" {
  description = "List of subdomains for VDS RU"
  type        = list(string)
  default = [
    "bach"
  ]
}

variable "domains_vpn" {
  description = "List of subdomains for VDS VPN"
  type        = list(string)
  default = [
    "@"
  ]
}
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
    "mas",
    "matrix",
    "mousebook",
    "moviecat",
    "mrtc",
    "synapse"
  ]
}

variable "domains_vpn" {
  description = "List of subdomains for VDS VPN"
  type        = list(string)
  default = [
    "@"
  ]
}
variable "twc_token" {
  description = "Timeweb Cloud API token"
  type        = string
  sensitive   = true
}

variable "ipv4_k3s" {
  description = "IP VDS K3S"
  type        = string
  sensitive   = true
}

variable "ipv4_vpn" {
  description = "IP VDS VPN"
  type        = string
  sensitive   = true
}

variable "domains_k3s" {
  description = "List of subdomains for VDS K3S"
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
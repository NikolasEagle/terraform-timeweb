### DATA SOURCES ###

data "twc_dns_zone" "eagle" {
  name = "eagle.com.ru"
}

### A RECORDS ###

resource "twc_dns_rr" "a_records_k3s" {
  for_each = toset(var.domains_k3s)
  zone_id  = data.twc_dns_zone.eagle.id
  name     = each.key
  type     = "A"
  value    = var.ipv4_k3s
}

resource "twc_dns_rr" "a_records_vpn" {
  for_each = toset(var.domains_vpn)
  zone_id  = data.twc_dns_zone.eagle.id
  name     = each.key
  type     = "A"
  value    = var.ipv4_vpn
}

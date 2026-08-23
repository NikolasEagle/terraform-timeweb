### DATA SOURCES ###

data "twc_dns_zone" "eagle" {
  name = "eagle.com.ru"
}

### A RECORDS ###

resource "twc_dns_rr" "a_records_kz" {
  for_each = toset(var.domains_kz)
  zone_id  = data.twc_dns_zone.eagle.id
  name     = each.key
  type     = "A"
  value    = var.ipv4_kz
}

resource "twc_dns_rr" "a_records_ru" {
  for_each = toset(var.domains_ru)
  zone_id  = data.twc_dns_zone.eagle.id
  name     = each.key
  type     = "A"
  value    = var.ipv4_ru
}

resource "twc_dns_rr" "a_records_vpn" {
  for_each = toset(var.domains_vpn)
  zone_id  = data.twc_dns_zone.eagle.id
  name     = each.key
  type     = "A"
  value    = var.ipv4_vpn
}

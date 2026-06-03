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

### EMAIL SECURITY RECORDS ###

resource "twc_dns_rr" "dmarc" {
  zone_id = data.twc_dns_zone.eagle.id
  name    = "_dmarc"
  type    = "TXT"
  value   = "v=DMARC1; p=reject; rua=mailto:admin@${data.twc_dns_zone.eagle.name}; ruf=mailto:admin@${data.twc_dns_zone.eagle.name}; adkim=s; aspf=s"
}

resource "twc_dns_rr" "dkim" {
  zone_id = data.twc_dns_zone.eagle.id
  name    = "dkim._domainkey"
  type    = "TXT"
  value   = "v=DKIM1; k=rsa; p=${var.dkim_pubkey}"
}

resource "twc_dns_rr" "spf_mail" {
  zone_id = data.twc_dns_zone.eagle.id
  name    = "@"
  type    = "TXT"
  value   = "v=spf1 mx a:mail.${data.twc_dns_zone.eagle.name} ~all"
}

resource "twc_dns_rr" "report_dmarc" {
  zone_id = data.twc_dns_zone.eagle.id
  name    = "${data.twc_dns_zone.eagle.name}._report._dmarc"
  type    = "TXT"
  value   = "v=DMARC1;"
}

### CNAME RECORDS ###

resource "twc_dns_rr" "autoconfig_cname" {
  zone_id = data.twc_dns_zone.eagle.id
  name    = "autoconfig"
  type    = "CNAME"
  value   = "mail.${data.twc_dns_zone.eagle.name}"
}

resource "twc_dns_rr" "autodiscover_cname" {
  zone_id = data.twc_dns_zone.eagle.id
  name    = "autodiscover"
  type    = "CNAME"
  value   = "mail.${data.twc_dns_zone.eagle.name}"
}

### MX RECORDS ###

resource "twc_dns_rr" "mx" {
  zone_id = data.twc_dns_zone.eagle.id
  name    = "@"
  type    = "MX"
  value   = "10 mail.${data.twc_dns_zone.eagle.name}"
}
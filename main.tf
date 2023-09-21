provider "ultradns" {
  username = var.username
  password = var.password
  hosturl = var.host
}

resource "ultradns_record" "a" {
  zone_name = "0-0-0-0-0antony.com."
  owner_name = "wwww"
  record_type = "A"
  ttl = 800
  record_data = ["1.1.1.1"]
}

output "Test" {
  value = ultradns_record.a
}

provider "ultradns" {
  username = var.username
  password = var.password
  hosturl = var.host
}

resource "ultradns_zone" "primary" {
    name        = "2-cst-13592.com."
    account_name = "GTV8"
    type        = "PRIMARY"
    primary_create_info {
        create_type = "NEW"
    }
}


resource "ultradns_record" "txt" {
    count = length(range(1, 1000))
    zone_name = ultradns_zone.primary.name
    owner_name = count.index
    record_type = "TXT"
    ttl = 500
    record_data = ["Sample data"]
}


resource "ultradns_record" "A" {
    count = length(range(1, 1000))
    zone_name = ultradns_zone.primary.name
    owner_name = count.index
    record_type = "A"
    ttl = 500
    record_data = ["127.0.0.1"]
}

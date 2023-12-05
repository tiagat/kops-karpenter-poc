resource "aws_route53_zone" "sandbox" {
  name = var.dns_zone_name
}

data "aws_route53_zone" "root" {
  name = "tiagat.dev"
}

resource "aws_route53_record" "sandbox-ns" {
  zone_id = data.aws_route53_zone.root.zone_id
  name    = var.dns_zone_name
  type    = "NS"
  ttl     = "30"
  records = aws_route53_zone.sandbox.name_servers
}

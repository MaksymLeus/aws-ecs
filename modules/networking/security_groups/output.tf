output "name" {
  value = "value"
}
output "http_aceess_id" {
  value = aws_security_group.http_aceess.id
}
output "ssh_access_id" {
  value = aws_security_group.ssh_access.id
}
output "icmp_access_id" {
  value = aws_security_group.icmp_access.id
}

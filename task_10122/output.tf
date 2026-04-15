output "ec2" {
  value       = aws_instance.public_instance.id
}
output "ec2_2" {
  value       = aws_instance.private_instance.id
}           			
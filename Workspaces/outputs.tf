output "public_ip_op" {
  description = "EC2 Machine Public Ip"
  value = aws_instance.tf-ec2.*.public_ip
}
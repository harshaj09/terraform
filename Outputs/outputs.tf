# # This will be used to configure the output values 

# resource "" "name" {
  
# }

# #resource_name.localname.attribute 

# variable "" {
# }
# #var.name

output "public_ip_op" {
  description = "EC2 Machine Public Ip"
  value = aws_instance.tf-ec2.public_ip

}

output "list_of_SG" {
  description = "Listing the SG's used for the EC2 machine"
  value = aws_instance.tf-ec2.security_groups
}

# # In EC2 machines, along with public ip , dns will automatically gemerate
output "public_dns_op" {
  value = "http://${aws_instance.tf-ec2.public_dns}"
}
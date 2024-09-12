

# EC2 instance
resource "aws_instance" "tf-ec2" {
  #count         = var.instance_count # 0,1,2
  ami           = "ami-04e5276ebb8451442"
  #instance_type = var.instance_type[2] # 750 hours
  instance_type =  var.instance_type["dev"]
  #key_name      = "terraformd3"
  #key_name = "newterraform"
  vpc_security_group_ids = [
    aws_security_group.tf-sg-allow-ssh.id,
    aws_security_group.tf-sg-allow-http-https.id
  ]
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y httpd
    sudo service httpd start
    sudo systemctl enable httpd
    echo "<h1> Welcome to depends_on Session </h1>" > /var/www/html/index.html
  EOF
  tags = var.instance_tags
}


# webserver

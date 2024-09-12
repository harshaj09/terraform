
#  aws_security_group.tf-sg-allow-ssh.id,
#    aws_security_group.tf-sg-allow-http-https.id


resource "aws_security_group" "tf-sg-allow-ssh" {
    # ssh, http, ports
    name = "i27-sg-ssh-${terraform.workspace}"
    description = "This SG allows ssh traffic"
    # ingress, egress
    ingress {
      description = "Allos SSH"
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
      "Name" = "i27-sg-ssh-${terraform.workspace}"
    }
}


resource "aws_security_group" "tf-sg-allow-http-https" {
    #  http, ports
    name = "i27-sg-http-https-${terraform.workspace}"
    description = "This SG allows http https traffic"
    # ingress, egress
    ingress {
      description = "Allos http"
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
      description = "Allow https"
      from_port = 443
      to_port = 443
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
      "Name" = "i27-sg-http-https-${terraform.workspace}"
    }
}

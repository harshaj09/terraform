# Create a Security Group
resource "aws_security_group" "tf-sg-allow-ssh" {
  # ssh, http, ports
  name        = "allow-ssh"
  description = "This SG allows   ssh "
  # ingress, egress
  ingress {
    description = "Allos SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = "allow-ssh"
  }
}

# Sg to create http and https
resource "aws_security_group" "tf-sg-allow-http-https" {
  # ssh, http, ports
  name        = "allow-http-https"
  description = "This SG allows http and https "
  # ingress, egress
  ingress {
    description = "Allos http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allos https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = "allow-http-https"
  }
}
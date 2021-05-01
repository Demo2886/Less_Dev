provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "my-dev" {
  ami                    = "ami-0767046d1677be5a0"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p ${var.server_port} &
              EOF

  tags = {
    Name = "Dev-Test"
  }
}

resource "aws_security_group" "instance" {

  name = var.security_group_demo

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#resource "aws_instance" "my-hut" {
#  ami           = "ami-009b16df9fcaac611"
#  instance_type = "t2.micro"
#  tags = {
#    Name = "RedHut"
#  }
#}

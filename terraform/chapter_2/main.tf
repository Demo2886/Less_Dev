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
              nohup busybox httpd -f -p 8080 &
              EOF

  tags = {
    Name = "Dev-Test"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port   = 8080
    to_port     = 8080
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

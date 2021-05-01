provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "my-dev" {
  ami           = "ami-0767046d1677be5a0"
  instance_type = "t2.micro"
  tags = {
    Name = "Dev-Test"
  }
}

resource "aws_instance" "my-hut" {
  ami           = "ami-009b16df9fcaac611"
  instance_type = "t2.micro"
  tags = {
    Name = "RedHut"
  }
}

output "public_ip" {
  value       = aws_instance.my-dev.public_ip
  description = "The public IP address of the web server"
}

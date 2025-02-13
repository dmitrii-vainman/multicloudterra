resource "aws_security_group" "instance_sg" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2_instance" {
  ami           = "ami-099da3ad959447ffa" # Ubuntu AMI (ändert sich je nach Region)
  instance_type = "t2.micro"
  security_groups = [aws_security_group.instance_sg.name]

  tags = {
    Name = "Terraform-EC2"
  }
}

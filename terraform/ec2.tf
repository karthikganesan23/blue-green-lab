data "aws_ami" "ubuntu_jammy" {
  most_recent = true
  owners      = ["099720109477"]
  filter { 
	name="name" 
	values=["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"] 
  }
}
resource "aws_instance" "jenkins" {
  ami                         = data.aws_ami.ubuntu_jammy.id
  instance_type               = var.jenkins_instance_type
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.jenkins_sg.id]
  associate_public_ip_address = true
  key_name                    = var.key_name
  tags = { Name = "bg-jenkins" }
}

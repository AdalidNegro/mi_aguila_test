resource "aws_instance" "mi_aguila_process" {
  count                       = length(var.ec2_list)
  ami                         = data.aws_ami.debian_base_image.image_id
  instance_type               = "m4.large"
  key_name                    = aws_key_pair.mi_aguila_key.id
  subnet_id                   = aws_subnet.public_subnet_a.id
  vpc_security_group_ids      = [aws_security_group.mi_aguila_public_security_group.id]
  associate_public_ip_address = true
  user_data                   = file("${var.ec2_list[count.index]}.sh")

  tags = {
    Name = "${var.aws_region} ${var.environment} Mi Aguila ${var.ec2_list[count.index]}"
  }
}

resource "aws_instance" "mi_aguila_webapp" {
  ami                         = data.aws_ami.debian_base_image.image_id
  instance_type               = "m3.medium"
  key_name                    = aws_key_pair.mi_aguila_key.id
  subnet_id                   = aws_subnet.public_subnet_a.id
  vpc_security_group_ids      = [aws_security_group.mi_aguila_public_security_group.id]
  associate_public_ip_address = true
  user_data                   = file("webapp.sh")

  tags = {
    Name = "${var.aws_region} ${var.environment} Mi Aguila Webapp"
  }
}
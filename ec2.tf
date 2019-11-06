resource "aws_instance" "mi_aguila_admin_process" {
  ami                         = data.aws_ami.debian_base_image.image_id
  instance_type               = "m4.large"
  key_name                    = aws_key_pair.mi_aguila_key.id
  subnet_id                   = aws_subnet.public_subnet_a.id
  vpc_security_group_ids      = [aws_security_group.mi_aguila_public_security_group.id]
  associate_public_ip_address = true
  source_dest_check           = false
  user_data                   = file("admin.sh")

  tags = {
    Name = "${var.aws_region} ${var.environment} Mi Aguila Admin"
  }
}

resource "aws_instance" "mi_aguila_client_process" {
  ami                         = data.aws_ami.debian_base_image.image_id
  instance_type               = "m4.large"
  key_name                    = aws_key_pair.mi_aguila_key.id
  subnet_id                   = aws_subnet.public_subnet_a.id
  vpc_security_group_ids      = [aws_security_group.mi_aguila_public_security_group.id]
  associate_public_ip_address = true
  source_dest_check           = false
  user_data                   = file("client.sh")

  tags = {
    Name = "${var.aws_region} ${var.environment} Mi Aguila Client"
  }
}

resource "aws_instance" "mi_aguila_driver_process" {
  ami                         = data.aws_ami.debian_base_image.image_id
  instance_type               = "m4.large"
  key_name                    = aws_key_pair.mi_aguila_key.id
  subnet_id                   = aws_subnet.public_subnet_a.id
  vpc_security_group_ids      = [aws_security_group.mi_aguila_public_security_group.id]
  associate_public_ip_address = true
  source_dest_check           = false
  user_data                   = file("driver.sh")

  tags = {
    Name = "${var.aws_region} ${var.environment} Mi Aguila Driver"
  }
}
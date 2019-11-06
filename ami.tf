data "aws_ami" "debian_base_image" {
  most_recent = true
  owners      = ["379101102735"]

  filter {
    name   = "name"
    values = ["debian-stretch-hvm-x86_64-gp2-2019-08-06-10230"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
resource "aws_key_pair" "mi_aguila_key" {
  key_name   = "${var.aws_region}-${var.environment}_vpc_mi_aguila_key_pair"
  public_key = file(var.key_path)
}

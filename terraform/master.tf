resource "aws_instance" "kub-master" {
  ami = var.imagemst
  instance_type = "t2.medium"
  #subnet_id = aws_subnet.sub-us-east-1a.id
  #vpc_security_group_ids = [aws_security_group.sg01.id]
 tags = {
    Name = "master"
  }
 key_name = "proj-feb"
}

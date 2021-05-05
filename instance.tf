resource "aws_instance" "myec2" {
  #vpc_security_group_ids = ["${aws_security_group.mysg_group.id}"]
  ami = "ami-013f17f36f8b1fefb"
  instance_type = "t2.micro"
  key_name = "terraform"

  subnet_id      = aws_subnet.terraform_subnet.id
  vpc_security_group_ids = [ aws_security_group.mysg_group.id ]

  tags = {
    Name = "terraform_ec2"
  }

}

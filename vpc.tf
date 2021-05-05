#VPC
resource "aws_vpc" "terraform_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "terraform_vpc"
  }
}

#Subnet1
resource "aws_subnet" "terraform_subnet" {
  vpc_id = aws_vpc.terraform_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "terraform_subnet"
  }
}

#InternetGW
resource "aws_internet_gateway" "terrform_IGW" {
  vpc_id = aws_vpc.terraform_vpc.id

  tags = {
    Name = "terraform_IGW"
  }
}

#route_table
resource "aws_route_table" "terraform_rt" {
  vpc_id = aws_vpc.terraform_vpc.id

  tags = {
    Name = "terraform_rt"
  }
}

#association
resource "aws_route_table_association" "terraform_association" {
  subnet_id      = aws_subnet.terraform_subnet.id
  route_table_id = aws_route_table.terraform_rt.id
}

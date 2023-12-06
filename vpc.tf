resource "aws_vpc" "my_vpc" {    
cidr_block =var.vpc_cidr
tags = {
  Name="my_vpc_test"
}  
}

resource"aws_subnet" "subnet1"{
    vpc_id = aws_vpc.my_vpc.id
    count = var.subnet_count
    cidr_block = var.subnet_cidrs[count.index]
    tags = {
      Name ="subnet ${count.index+1}"
    }
  
}  

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "internet_gateway"
  }
}
resource "aws_route_table" "new" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "new_route"
  }
}

resource "aws_route_table_association" "association" {
  count = length(aws_subnet.subnet1.*.id)
  subnet_id      = aws_subnet.subnet1.*.id[count.index]
  route_table_id = aws_route_table.new.id
}
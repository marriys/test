resource "aws_instance" "todo" {
  ami           = lookup(var.ami_user, var.region ,"us-east-2")
  count=2
  instance_type = "t2.micro"
  key_name = "new"
  associate_public_ip_address = true
  subnet_id = aws_subnet.subnet1.*.id[count.index]
  user_data = file("./script/httpd.sh")
  user_data_replace_on_change = true
  tags = {
    Name = "HelloWorld ${count.index+1}"
  }
}
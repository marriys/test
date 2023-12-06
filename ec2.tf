resource "aws_instance" "todo" {
  ami           = "ami-06d4b7182ac3480fa"
  instance_type = "t2.micro"
  key_name = "new"
  associate_public_ip_address = true
  subnet_id = aws_subnet.subnet1.id
  user_data = file("./script/httpd.sh")
  user_data_replace_on_change = true
  tags = {
    Name = "HelloWorld"
  }
}
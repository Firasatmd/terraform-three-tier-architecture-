
#creating ec2 instance in 1st public subnet

resource "aws_instance" "myinstance1" {
  ami                         = "ami-0607784b46cbe5816"
  instance_type               = "t2.micro"
  count                       = 1
  key_name                    = "mykey"
  vpc_security_group_ids      = [aws_security_group.websg.id]
  subnet_id                   = aws_subnet.public-subnet-1.id
  associate_public_ip_address = true
  user_data                   = file("user.sh")

  tags = {
    Name = "myinstance1"
  }
}


#creating ec2 instance in 2nd public subnet

resource "aws_instance" "myinstance2" {
  ami                         = "ami-0607784b46cbe5816"
  instance_type               = "t2.micro"
  count                       = 1
  key_name                    = "mykey"
  vpc_security_group_ids      = [aws_security_group.websg.id]
  subnet_id                   = aws_subnet.public-subnet-2.id
  associate_public_ip_address = true
  user_data                   = file("user.sh")

  tags = {
    Name = "myinstance2"
  }
}


provider "aws" {
  region     = "ap-southeast-1"
  shared_credentials_file = "$HOME/.aws/credentials"
  profile                 = "default"
  version = ">=2.0"
}

variable "instance_names" {
  type = list
  default = ["web-front","web-back","web-db"]
}

resource "aws_instance" "multi-instance" {
  ami           = "ami-0cd31be676780afa7"
  instance_type = "t2.micro"
  count = 3

  tags = {
    Name = var.instance_names[count.index]
    # or 
    # Name = "hello-${count.index}"
  }
}

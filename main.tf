provider "aws" {  
  region                   = "us-east-1"
}

# data "aws_ami" "ubuntu" {    
#     most_recent = true
#     filter {
#         name   = "name"
#         values = ["ubuntu/images/ubuntu-*-*-amd64-server-*"]
#    }

#    owners = ["099720109477"]
# }

resource "aws_instance" "web" {
//  ami           = data.aws_ami.ubuntu.id
  ami = "ami-04505e74c0741db8d"
 // instance_type = local.instance_type_map.stage
  count = local.instance_count_map.stage
  tags = {
    Name = "Netology ${count.index + 1 }"
  }
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
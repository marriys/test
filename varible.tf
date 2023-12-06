variable "ami_user" {
    default = {
    "us-east-2" :"ami-06d4b7182ac3480fa"
    "ap-south-1":"ami-02a2af70a66af6dfb"
    }
  
}
variable "region" {
    default = "us-east-2"
  
}

variable "vpc_cidr" {
   
    default="10.0.0.0/16"
    type=string
  
}

variable "subnet_cidrs" {
    default=["10.0.0.0/24","10.0.2.0/24"]
    type=list(string)

  
}
variable "subnet_count" {
    default = 2
  
}
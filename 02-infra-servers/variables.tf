variable "instances" {
    type = map
    default = {
        mongodb = "t3.small"
        redis = "t3.micro"
        mysql = "t3.small"
        rabittmq = "t3.micro"
        catalogue = "t3.micro"
        user = "t3.micro"
        cart = "t3.micro"
        shipping = "t3.small"
        payment = "t3.micro"
        dispatch = "t3.micro"   #python application
        frontend = "t3.micro"   # golang application
    }
}

variable "sg_allow_all"{
    type = string
    default = "sg-111111111"
}

variable "zone_id" {
    type = string
    default = "z00-------"
}

variable "domain_name" {
    type = string
    default = "daws81.suresh.com"
}
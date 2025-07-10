variable "project"{
    type = string
    default = "Roboshop"
}

variable "environment"{
    type = string
    default = "dev"
}

variable "vpn_ports" {
    default = [22, 443, 80, 943, 945, 1194]
}

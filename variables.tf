variable "resource_group_name" {
    type = string
    default = "rg-24-04-on-vainman-dmitrii"
}
variable "aws_region" {
  default = "eu-central-1"
}

variable "location" {
    type = string
    default = "West Europe"
}

variable "storage_account_name" {
    type = string
    default = "dimawebsite"
}

variable "index_document" {
    type = string
    default = "index.html"
}

variable "error_document" {
    type = string
    default = "error.html"
}
variable "users" {
    default = ["root", "user1", "user2"]
}

variable "region" {
    default = "ap-southeast-1"
    }

output "user_type" {
    value = "${var.users}"
}

output "region" {
    value = "${var.region}"
}

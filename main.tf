variable "users" {
    default = ["root", "user1", "user2"]
}

output "user_type" {
    value = "${var.users}"
}

output "region" {
    value = "${var.region}"
}

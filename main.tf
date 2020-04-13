variable "users" {
    type    = "list"
    default = ["root", "user1", "user2"]
}

output "user_type" {
    value = "${var.users}"
}

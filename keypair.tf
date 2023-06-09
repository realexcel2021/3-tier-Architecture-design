resource "aws_key_pair" "two_tier_key_pair" {
    key_name = "Two_Tier_Key_Pair"
    public_key = tls_private_key.two_tier_key_info.public_key_openssh
}

resource "tls_private_key" "two_tier_key_info" {
    algorithm = "RSA"
    rsa_bits = 4096
}

resource "local_file" "key_pair_file" {
    content = tls_private_key.two_tier_key_info.private_key_pem
    filename = "Two-Tier_Key-Pair"
}
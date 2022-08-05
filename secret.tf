# Creates and stores ssh key used creating an EC2 instance
resource "aws_secretsmanager_secret" "secret" {
  name = "mysecret1"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "smanager" {
  secret_id     = aws_secretsmanager_secret.secret.id
  secret_string = tls_private_key.mykey.private_key_pem
}
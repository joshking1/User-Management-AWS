# Create a new IAM user named "Yemi"
resource "aws_iam_user" "yemi" {
  name = "Yemi"
}

# Set the password for the user
resource "aws_iam_user_login_profile" "yemi_password" {
  user                    = aws_iam_user.yemi.name
  password_reset_required = true
}

# Create a new IAM group named "Developers"
resource "aws_iam_group" "developers" {
  name = "Developers"
}

# Add the user to the "Developers" group
resource "aws_iam_group_membership" "yemi_developers_membership" {
  name = aws_iam_user.yemi.name
  users = [
    aws_iam_user.yemi.name,
  ]

  group = aws_iam_group.developers.name
}

# Attach the AmazonEC2FullAccess policy to the "Developers" group
resource "aws_iam_group_policy_attachment" "developers_ec2_policy" {
  group      = aws_iam_group.developers.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

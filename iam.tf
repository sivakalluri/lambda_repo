
module "iam_role" {
  source       = "git::https://github.com/sivakalluri/samplerepo.git?ref=feature"
  role_name = "samplerole"
  policy_name = "samplepolicy"
}



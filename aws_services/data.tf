data "terraform_remote_state" "network" {
    backend = "s3"
    config = {
        bucket    = "rbs-deployment-bucket"
        key       = "network/network.tfstate"
        region    = "ap-southeast-1"
    }
}
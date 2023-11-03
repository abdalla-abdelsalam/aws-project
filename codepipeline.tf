# resource "aws_codepipeline" "my_pipeline" {
#   name     = "my-codepipeline" # Replace with your desired pipeline name
#   role_arn = aws_iam_role.my_pipeline_role.arn

#   artifact_store {
#     location = aws_s3_bucket.my_bucket.bucket
#     type     = "S3"
#   }

#   stage {
#     name = "Source"

#     action {
#       name             = "SourceAction"
#       category         = "Source"
#       owner            = "AWS"
#       provider         = "CodeCommit"
#       version          = "1"
#       output_artifacts = ["SourceArtifact"]

#       configuration = {
#         RepositoryName = "my-repo" # Replace with your CodeCommit repository name
#         BranchName     = "main"    # Replace with your desired branch name
#       }
#     }
#   }

#   stage {
#     name = "Build"

#     action {
#       name             = "BuildAction"
#       category         = "Build"
#       owner            = "AWS"
#       provider         = "CodeBuild"
#       version          = "1"
#       input_artifacts  = ["SourceArtifact"]
#       output_artifacts = ["BuildArtifact"]

#       configuration = {
#         ProjectName = "my-build-project" # Replace with your CodeBuild project name
#       }
#     }
#   }

#   stage {
#     name = "Deploy"

#     action {
#       name             = "DeployAction"
#       category         = "Deploy"
#       owner            = "AWS"
#       provider         = "ECS"
#       version          = "1"
#       input_artifacts  = ["BuildArtifact"]
#       output_artifacts = []

#       configuration = {
#         ClusterName         = "my-ecs-cluster" # Replace with your ECS cluster name
#         ServiceName         = "my-ecs-service" # Replace with your ECS service name
#         Image1ArtifactName  = "BuildArtifact"
#         Image1ContainerName = "my-container1-name" # Replace with your container name
#         Image1RegistryType  = "ECR"
#         Image1Namespace     = "my-ecr-namespace" # Replace with your ECR namespace
#         Image1Tag           = "latest"           # Replace with your desired image tag
#       }
#     }
#   }
# }

# resource "aws_iam_role" "my_pipeline_role" {
#   name = "my-pipeline-role" # Replace with your desired IAM role name

#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "codepipeline.amazonaws.com"
#       },
#       "Action": "sts:AssumeRole"
#     }
#   ]
# }
# EOF
# }

# resource "aws_s3_bucket" "my_bucket" {
#   bucket = "my-artifact-bucket" # Replace with your desired S3 bucket name
# }
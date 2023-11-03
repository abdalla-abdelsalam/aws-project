pipeline {
    agent any
        environment {
        // adding aws credentials    
        AWS_ACCESS_KEY_ID = credentials('aws_access_key_id')
        AWS_SECRET_ACCESS_KEY = credentials('aws_secret_access_key')
    }
    parameters {
        choice(
            // define two environments to choose from
            name: 'ENVIRONMENT',
            choices: ['dev','prod'],
            description: 'Select the environment to apply Terraform code'
        )
    }

    stages {
        stage("Clone Repository")
        {
            steps{
                // Checkout Terraform code from git repository
                git branch: 'main', url: 'https://github.com/mennahasan7/final-project.git'
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    // Determine the Terraform workspace based on the selected environment
                    // Create a new workspace if it doesn't exist
                    // Run terraform init command based on the chosen environment
                    def tfWorkspace = "${params.ENVIRONMENT}"
                    dir('.') {
                        sh "terraform init"
                        sh "terraform workspace select ${tfWorkspace} || terraform workspace new ${tfWorkspace}"
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    // Run Terraform apply command based on the chosen environment
                    def tfvarsfile = "${params.ENVIRONMENT}.tfvars"
                    dir('.') {
                        sh "terraform apply -auto-approve --var-file ${tfvarsfile}"
                    }
                }
            }
        }

        stage('trigger another pipeline') {
            steps {
                script {
                    build job: 'deployment pipeline'
                }
            }
        }

    }
}
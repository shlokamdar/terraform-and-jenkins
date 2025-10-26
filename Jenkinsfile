
pipeline {
    agent any

    environment {
        TF_VERSION = "1.6.0"
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-access-key-id')
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub
                git branch: 'main', url: 'https://github.com/shlokamdar/terraform-and-jenkins.git'
            }
        }

        stage('Terraform Init') {
            steps {
                // Initialize Terraform with backend config
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                // Use the tfvars file for variable values
                sh 'terraform plan -var-file="terraform.tfvars" -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                // Ask for manual approval before applying
                input message: 'Approve Terraform Apply?', ok: 'Apply'
                
                // Apply the plan using tfvars
                sh 'terraform apply -var-file="terraform.tfvars" -auto-approve tfplan'
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
        success {
            echo 'Infrastructure deployed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check logs for errors.'
        }
    }
}

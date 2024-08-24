pipeline {
    agent any
    
    environment {
        // Replace 'AWS' with the actual ID of your stored credentials in Jenkins
        AWS_CREDENTIALS = credentials('AWS')
    }
    
    stages {
        stage('Clone Repository') {
            steps {
                // Clone the GitHub repository containing the Terraform files
                git branch: 'main', url: 'https://github.com/nidhi-ashtikar/infra-tf-creation.git'
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    // Initialize Terraform
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    // Create a Terraform plan////
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Approval') {
            steps {
                // Manual approval step before applying Terraform changes
                input message: 'Approve Terraform Apply?', ok: 'Deploy'
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    // Apply the Terraform plan
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }

        stage('Destroy Approval') {
            steps {
                // Manual approval step before destroying Terraform-managed infrastructure
                input message: 'Approve Terraform Destroy?', ok: 'Destroy'
            }
        }

        stage('Terraform Destroy') {
            steps {
                script {
                    // Destroy the Terraform-managed infrastructure
                    sh 'terraform destroy -auto-approve'
                }
            }
        }
    }

    post {
        always {
            // Clean up the workspace after the build is complete.
            cleanWs()
        }
    }
}

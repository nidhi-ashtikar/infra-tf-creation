pipeline {
    agent any

    parameters {
        choice(choices: ['us-east-2', 'us-east-1', 'us-west-1'], description: 'Select in which region you want to deploy the resource', name: 'region')
        string(name: 'instance_name', defaultValue: 'my-instance', description: 'EC2 Instance Name')
        string(name: 'instance_type', defaultValue: 't2.micro', description: 'EC2 Instance Type')
        credentials(name: 'aws_credentials', description: 'Select AWS credentials', defaultValue: 'AWS', credentialType: 'com.cloudbees.plugins.credentials.impl.UsernamePasswordCredentialsImpl')
       
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
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: "${params.aws_credentials}"]]) {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: "${params.aws_credentials}"]]) {
                    sh """
                    terraform plan \
                    -var 'region=${params.region}' \
                    -var 'instance_name=${params.instance_name}' \
                    -var 'instance_type=${params.instance_type}'
                    """
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: "${params.aws_credentials}"]]) {
                    sh """
                    terraform apply -auto-approve \
                    -var 'region=${params.region}' \
                    -var 'instance_name=${params.instance_name}' \
                    -var 'instance_type=${params.instance_type}'
                    """
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

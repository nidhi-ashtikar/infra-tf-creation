pipeline {
    agent any

    parameters {
        string(name: 'AWS_ACCOUNT_ID', defaultValue: '', description: 'AWS Account ID')
        string(name: 'AWS_ACCESS_KEY', defaultValue: '', description: 'AWS Access Key')
        string(name: 'AWS_SECRET_KEY', defaultValue: '', description: 'AWS Secret Key')
        string(name: 'AWS_REGION', defaultValue: 'us-east-1', description: 'AWS Region')
        string(name: 'INSTANCE_NAME', defaultValue: 'my-instance', description: 'EC2 Instance Name')
        string(name: 'INSTANCE_TYPE', defaultValue: 't2.micro', description: 'EC2 Instance Type')
        string(name: 'ROOT_VOLUME_SIZE', defaultValue: '8', description: 'Root Volume Size in GB')
        text(name: 'USERDATA_SCRIPT', defaultValue: '', description: 'Userdata Script')
    }
    
    environment {
        AWS_ACCESS_KEY_ID = "${params.AWS_ACCESS_KEY}"
        AWS_SECRET_ACCESS_KEY = "${params.AWS_SECRET_KEY}"
        AWS_DEFAULT_REGION = "${params.AWS_REGION}"
    }
    
    stages {    
        stage('Clone Repository') {
            steps {
                // Clone the GitHub repository containing the Terraform filess
                git branch: 'main', url: 'https://github.com/nidhi-ashtikar/infra-tf-creation.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh """
                terraform plan \
                -var 'aws_account_id=${params.AWS_ACCOUNT_ID}' \
                -var 'aws_access_key=${params.AWS_ACCESS_KEY}' \
                -var 'aws_secret_key=${params.AWS_SECRET_KEY}' \
                -var 'region=${params.AWS_REGION}' \
                -var 'instance_name=${params.INSTANCE_NAME}' \
                -var 'instance_type=${params.INSTANCE_TYPE}' \
                -var 'root_volume_size=${params.ROOT_VOLUME_SIZE}' \
                -var 'userdata_script=${params.USERDATA_SCRIPT}'
                """
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

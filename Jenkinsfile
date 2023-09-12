pipeline {
    agent any
    
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWSID')
        AWS_SECRET_ACCESS_KEY = credentials('AWSKEY')
        AWS_REGION = credentials('AWSREGION')
    
    }


    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/itsbibin/jenkins-terraform'
            }
        }
        stage('Terraform init') {
            steps {
                sh '''
                echo "Initializing terraform"
                terraform init
                '''
            }
        }
        stage('Terraform plan') {
            steps {
                sh '''
                echo "Planning stage"
                terraform plan
                '''
            }
        }
         stage('Terraform Apply') {
            steps {
                sh '''
                echo "Deploy terraform resources"
                echo ${action}
                '''
            }
        }       
        
    }
}

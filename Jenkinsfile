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
        stage('Approval') {
            steps {
                script {
                    def deploymentDelay = input id: 'Deploy', message: 'Deploy to production?', submitter: 'admin', parameters: [choice(choices: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'], description: 'Hours to delay deployment?', name: 'deploymentDelay')]
                    sleep time: deploymentDelay.toInteger(), unit: 'HOURS'    
                }
            }
        }         
        stage('Approval 2') {
            steps {
      		// Create an Approval Button with a timeout of 15minutes.
                timeout(time: 15, unit: "MINUTES") {
                    input message: 'Do you want to approve the deployment?', ok: 'Yes'
                }
                echo "Proceeding with  deployment"
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

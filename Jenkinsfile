pipeline {
    agent any

    environment {
        DOCKERHUB_USER = 'karthikg23'
        IMAGE_NAME = "${DOCKERHUB_USER}/myapp"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/karthikganesan23/blue-green-lab.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:latest ./app'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh 'echo $PASS | docker login -u $USER --password-stdin'
                    sh 'docker push $IMAGE_NAME:latest'
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                echo 'Simulating deployment to Kubernetes...'
                echo 'Applying k8s/deployment-blue.yaml'
                echo 'deployment.apps/myapp-blue configured'
                echo 'Applying k8s/deployment-green.yaml'
                echo 'deployment.apps/myapp-green configured'
                echo 'Applying k8s/service.yaml'
                echo 'service/myapp-service unchanged'
            }
        }

        stage('Switch Traffic to Green') {
            steps {
                echo 'Simulating traffic switch to green deployment...'
                echo 'Updating service selector to point to myapp-green'
                echo 'Traffic successfully switched to green deployment'
            }
        }
    }
}
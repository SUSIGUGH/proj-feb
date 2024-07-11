pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker Image'
            }
        }
        
        stage('Push Image to DockerHub') {
            steps {
                echo 'Pushing image to Docker Hub'
            }
        }
        
        stage('Create EC2 instance with minikube') {
            steps {
                echo 'Creating EC2 instance with minikube'
            }
        }
        
        stage('Deploy blogging site') {
            steps {
                echo 'Deploying the blogging site'
            }
        }
    }
}

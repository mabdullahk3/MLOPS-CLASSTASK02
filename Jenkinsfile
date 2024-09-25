pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials') 
        IMAGE_NAME = 'your_dockerhub_username/salary-prediction'     
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/mabdullahk3/MLOPS-CLASSTASK02.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build("${env.IMAGE_NAME}:latest")
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    // Log into Docker Hub
                    docker.withRegistry('https://index.docker.io/v1/', env.DOCKERHUB_CREDENTIALS) {
                        echo 'Logged into Docker Hub'
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Push the Docker image to Docker Hub
                    docker.image("${env.IMAGE_NAME}:latest").push('latest')
                }
            }
        }
    }

    post {
        always {
            cleanWs() // Clean workspace after the build
        }
    }
}

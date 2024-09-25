pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials') 
        IMAGE_NAME = 'your_dockerhub_username/salary-prediction'     
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/mabdullahk3/MLOPS-CLASSTASK02.git' 
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${env.IMAGE_NAME}:latest")
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'DOCKERHUB_CREDENTIALS') {
                        echo 'Logged into Docker Hub'
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                // Push the Docker image to Docker Hub
                script {
                    docker.image("${env.IMAGE_NAME}:latest").push('latest')
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}

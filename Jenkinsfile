pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-id') // Jenkins credentials ID for DockerHub
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
                    def app = docker.build("mabdullahk3/my-image:${env.BUILD_ID}")
                }
            }
        }
        stage('Login to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKERHUB_CREDENTIALS) {
                        def app = docker.build("mabdullahk3/my-image:${env.BUILD_ID}")
                        app.push("${env.BUILD_ID}")
                        app.push("latest")
                    }
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

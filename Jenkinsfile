pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/mabdullahk3/MLOPS-CLASSTASK02.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    def app = docker.build("mabdullah12/jenkins-pipeline-image:${env.BUILD_ID}")
                }
            }
        }
        stage('Login to Docker Hub and Push Image') {
            steps {
                script {
                    // Use the stored credentials in Jenkins
                    withCredentials([usernamePassword(credentialsId: 'dockerhub_id', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh "docker login -u $DOCKER_USER -p $DOCKER_PASS"
                        
                        // Build and Push Docker Image
                        def app = docker.build("mabdullah12/jenkins-pipeline-image:${env.BUILD_ID}")
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

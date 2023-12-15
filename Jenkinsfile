pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('Dockerhub')
    
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Nagarajbadiger347/Django-hello-world-app.git'
            }
        }

        stage('Build and Push to Docker Hub') {
            steps {
                script {
                    DOCKER_USERNAME = DOCKER_HUB_CREDENTIALS_USR
                    DOCKER_IMAGE = "${DOCKER_USERNAME}/hello-world:${BUILD_NUMBER}"
                    sh "docker build -t ${DOCKER_IMAGE} ."
                    withDockerRegistry(credentialsId: 'Dockerhub', url: 'https://index.docker.io/v1/') {
                        sh "docker push ${DOCKER_IMAGE}"
                    }
                }
            }
        }

        stage('Deploying to K8s Cluster') {
            steps {
                script {
                       withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'k8s', namespace: '', restrictKubeConfigAccess: false, serverUrl: '') {
                              sh 'kubectl apply -f kube-deployment.yaml'
                  }          
            }
        }
    }
}

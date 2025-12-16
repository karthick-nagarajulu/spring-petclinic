pipeline {
    agent { label 'worker-node' }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/karthick-nagarajulu/spring-petclinic.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t spring-petclinic:1.0 .'
            }
        }

        stage('Run with Docker Compose') {
            steps {
                sh '''
                  docker-compose down || true
                  docker-compose up -d
                '''
            }
        }
    }
}

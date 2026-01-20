pipeline {
    agent { label 'jenkins-worker' }

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
        echo "Stopping and removing existing containers"
        docker compose down --remove-orphans || true

        echo "Removing old petclinic container if exists"
        docker rm -f petclinic_app || true

        echo "Starting containers"
        docker compose up -d
        '''
    }
}

    }
}

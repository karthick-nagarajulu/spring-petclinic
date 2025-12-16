pipeline {
    agent { label 'worker-node' }   // runs on worker node

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/<your-username>/spring-petclinic.git'
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

        // ✅ ADD YOUR STAGE HERE
        stage('Run Container') {
            steps {
                sh '''
                  docker rm -f petclinic || true
                  docker run -d -p 8080:8080 --name petclinic spring-petclinic:1.0
                '''
            }
        }
    }
}

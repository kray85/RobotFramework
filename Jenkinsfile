pipeline {
    agent any

    stages {
        stage('Install Dependencies') {
            steps {
                sh 'pip install robotframework'
            }
        }
        stage('Run Tests') {
            steps {
                sh 'robot --variable browser_name:Firefox --include REGRESSION .'
            }
        }
    }
}
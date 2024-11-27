pipeline {
    agent any

    stages {
        stage('Install Dependencies') {
            steps {
                sh '''
                    source tmp/jenkins/bin/activate
                '''
            }
        }
        stage('Run Tests') {
            steps {
                sh '''
                    source tmp/jenkins/bin/activate
                    robot --variable browser_name:Firefox --include REGRESSION tests
                '''
            }
        }
    }
}
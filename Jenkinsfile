pipeline {
    agent any

    stages {
        stage('Install Dependencies') {
            steps {
                sh '''
                    echo "Robot Framework and SeleniumLibrary installed"
                '''
            }
        }
        stage('Run Tests') {
            steps {
                sh '''
                    source tmp/jenkins/bin/activate
                    echo "Activated virtual environment"
                    which robot
                    echo "Running tests..."
                    robot --variable browser_name:Chrome --include REGRESSION tests
                '''
            }
        }
    }
}
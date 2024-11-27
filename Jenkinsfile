pipeline {
    agent any

    stages {
        stage('Install Dependencies') {
            steps {
                sh '''
                    source tmp/jenkins/bin/activate
                    pip install robotframework
                    pip install robotframework-seleniumlibrary
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
                    robot --variable browser_name:Firefox --include REGRESSION tests
                '''
            }
        }
    }
}
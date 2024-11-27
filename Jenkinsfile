pipeline {
    agent any

    stages {
        stage('Install Dependencies') {
            steps {
                sh '''
                    source tmp/jenkins/bin/activate
                    pip install robotframework
                    pip install robotframework-seleniumlibrary
                    echo "Robot Framework installed"
                '''
            }
        }
        stage('Run Tests') {
            steps {
                sh '''
                    source tmp/jenkins/bin/activate
                    echo "Running tests..."
                    robot --variable browser_name:Firefox --include REGRESSION tests
                '''
            }
        }
    }
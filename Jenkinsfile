pipeline {
    agent any

    stages {
        stage('Install Dependencies') {
            steps {
                sh '''
                    set -e
                    echo "Activating virtual environment..."
                    source tmp/jenkins/bin/activate
                    echo "Installing Robot Framework and SeleniumLibrary..."
                    pip install robotframework
                    pip install robotframework-seleniumlibrary
                    echo "Robot Framework and SeleniumLibrary installed"
                '''
            }
        }
        stage('Run Tests') {
            steps {
                sh '''
                    set -e
                    echo "Activating virtual environment..."
                    source tmp/jenkins/bin/activate
                    echo "Activated virtual environment"
                    which robot
                    echo "Running tests..."
                    robot --variable browser_name:Firefox --include REGRESSION /var/jenkins_home/workspace/RobotFramework/tests/tests
                '''
            }
        }
    }


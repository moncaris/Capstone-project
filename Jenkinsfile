pipeline {
    agent any

    environment {
        APP_NAME = 'my_web_app'
        APP_PORT = "8080" // Define the port on which the app will run
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Checkout the source code from the Git repository
                git branch: 'main', url: 'https://your-repo-url.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    // Example for Node.js applications
                    // Adjust the command depending on the tech stack (e.g., pip install for Python apps)
                    sh 'npm install'
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    // Running unit or integration tests
                    // For Node.js app: use Jest, Mocha, or another testing framework
                    sh 'npm test'
                }
            }
        }

        stage('Build Application') {
            steps {
                script {
                    // Build or package the application
                    // For Node.js, you might have a build step like below:
                    sh 'npm run build'
                    
                    // For Python/Java or other languages, adapt the build command accordingly
                }
            }
        }

        stage('Deploy Application') {
            steps {
                script {
                    // Deploying the application (running it locally using Docker)
                    // If you are using Docker, build and run the container

                    // Example of Docker deployment:
                    // Clean up old containers
                    sh 'docker rm -f ${APP_NAME} || true'

                    // Build Docker image
                    sh 'docker build -t ${APP_NAME}:latest .'

                    // Run the Docker container
                    sh 'docker run -d -p ${APP_PORT}:80 --name ${APP_NAME} ${APP_NAME}:latest'
                }
            }
        }
    }

    post {
        always {
            // Clean up workspace after the job finishes
            cleanWs()
        }
        success {
            echo "Web application deployed successfully!"
        }
        failure {
            echo "Build or deployment failed."
        }
    }
}


pipeline {
    agent {
        label 'AppServer'
    }

    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker image') {
            steps {
                script {
                    app = docker.build('flyxdocker/snake-game')
                }
            }
        }

        stage('SAST-SNYK') {
            steps {
                snykSecurity(
                    snykInstallation: 'Snyk',
                    snykTokenId: 'snyk-creds',
                    severity: 'critical'
                )
            }
        }

        stage('SonarQube Analysis') {
            agent {
                label 'AppServer'
            }
            steps {
                script {
                    def scannerHome = tool 'SonarScanner'
                    withSonarQubeEnv('sonarqube') {
                        sh "${scannerHome}/bin/sonar-scanner \
                            -Dsonar.projectKey=gameapp1 \
                            -Dsonar.sources=."
                    }
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-creds') {
                        app.push('latest')
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh 'docker-compose down'
                    sh 'docker-compose up -d'
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }

        success {
            echo 'Deployment succeeded'
        }

        failure {
            echo 'Deployment failed'
        }
    }
}

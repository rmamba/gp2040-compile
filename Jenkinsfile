pipeline {
    agent any

    environment {
        gitLabel = VersionNumber([
            projectStartDate: '2023-01-01',
            versionNumberString: "${params.gitLabel}",
            worstResultForIncrement: 'SUCCESS'
        ])
    }

    stages {
        stage('Unit Test') {
            steps {
                script {
                    currentBuild.displayName = "${params.gitLabel}"
                }
                echo 'Skipped...'
            }
        }
        stage('Docker Build') {
            steps {
                sh "docker build --build-arg debug_mode=--no-dev -t rmamba/gp2040-compile:2.0.0 ."
            }
        }
        stage('E2E Test (local)') {
            steps {
                echo 'Skipped...'
            }
        }
        stage('Docker:push') {
            steps {
                sh "docker push rmamba/gp2040-compile:2.0.0"
            }
        }
        stage('Push to stage') {
            steps {
                echo 'Skipped...'
            }
        }
        stage('E2E Test (stage)') {
            steps {
                echo 'Skipped...'
            }
        }
        stage('Docker:tag') {
            steps {
                sh "docker tag rmamba/gp2040-compile:2.0.0 rmamba/gp2040-compile:2.0.0-${params.gitLabel}"
                sh "docker push rmamba/gp2040-compile:2.0.0-${params.gitLabel}"
                sh "docker rmi rmamba/gp2040-compile:2.0.0-${params.gitLabel}"
                sh "docker rmi rmamba/gp2040-compile:2.0.0"
            }
        }
        stage('Push to production') {
            steps {
                echo 'Skipped...'
            }
        }
        stage('E2E Test (production)') {
            steps {
                echo 'Skipped...'
            }
        }
    }
}

pipeline {
    agent any

    environment {
        gitLabel = VersionNumber([
            projectStartDate: '2023-01-01',
            versionNumberString: "${params.gitLabel}",
            worstResultForIncrement: 'SUCCESS'
        ])
        GIT_LABEL = "${params.gitLabel}"
    }

    stages {
        stage('Docker Build') {
            steps {
                script {
                    currentBuild.displayName = "${params.gitLabel}"
                }
                sh "docker build --build-arg debug_mode=--no-dev -t rmamba/gp2040-compile:latest ."
            }
        }
        stage('Docker:push') {
            steps {
                sh "docker push rmamba/gp2040-compile:latest"
            }
        }
        stage('Docker:tag') {
            steps {
                sh "docker tag rmamba/gp2040-compile:latest rmamba/gp2040-compile:${params.gitLabel}"
                sh "docker push rmamba/gp2040-compile:${params.gitLabel}"
            }
        }
        stage('Docker:rmi') {
            steps {
                sh "docker rmi rmamba/gp2040-compile:${params.gitLabel}"
                sh "docker rmi rmamba/gp2040-compile:latest"
            }
        }
    }
}

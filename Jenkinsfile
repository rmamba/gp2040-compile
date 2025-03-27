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
        stage('Docker Build') {
            steps {
                sh "docker build --build-arg debug_mode=--no-dev -t rmamba/gp2040-compile:${params.gitLabel} ."
            }
        }
        stage('Docker:push') {
            steps {
                sh "docker push rmamba/gp2040-compile:${params.gitLabel}"
            }
        }
        stage('Docker:rmi') {
            steps {
                sh "docker rmi rmamba/gp2040-compile:${params.gitLabel}"
            }
        }
    }
}

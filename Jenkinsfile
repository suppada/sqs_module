pipeline {
    agent any
    parameters {
        string(name: 'BRANCH', defaultValue: 'main', description: 'Git Branch Name')
        choice(name: 'MAKE', choices: ['apply', 'destroy', 'fmt', 'validate',], description: 'make configurations')
    }
    options {
        timestamps()
        buildDiscarder(logRotator(artifactDaysToKeepStr: '4', artifactNumToKeepStr: '3', daysToKeepStr: '3', numToKeepStr: '3'))
        timeout(time: 10, unit: 'MINUTES')
    }
    stages{
        stage('Make init'){
            steps {
                sh """
                    make "${params.MAKE}"
                """
            }
        }
    
    }
}
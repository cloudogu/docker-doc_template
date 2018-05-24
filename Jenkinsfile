@Library('github.com/cloudogu/ces-build-lib@9eec8e6')
import com.cloudogu.ces.cesbuildlib.*

node('docker') {

    properties([
            // Keep only the last x builds to preserve space
            buildDiscarder(logRotator(numToKeepStr: '10')),
            // Don't run concurrent builds for a branch, because they use the same workspace directory
            disableConcurrentBuilds()
    ])

    Git git = new Git(this)

    catchError {

        stage('Checkout') {
            checkout scm
        }

        stage('BuildAndPush') {
            def dockerImage = docker.build("cloudogu/doc_template")

            docker.withRegistry('https://registry.hub.docker.com/', 'dockerHubCredentials') {
                if (git.isTag()) {
                    dockerImage.push(git.tag)
                } else if (env.BRANCH_NAME == 'master') {
                    dockerImage.push("latest")
                } else {
                    echo "Skipping deployment to docker hub because current branch is ${env.BRANCH_NAME}."
                }
            }
        }
    }

    mailIfStatusChanged(git.commitAuthorEmail)
}

@Library('github.com/cloudogu/ces-build-lib@094c923')
import com.cloudogu.ces.cesbuildlib.*

node {
    Git git = new Git(this)

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

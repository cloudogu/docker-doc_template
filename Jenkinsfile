node {
    stage('Checkout') {
	checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/cloudogu/docker-doc_template']]])
    }
    
    stage('BuildAndPush') {
        def dockerImage = docker.build("cloudogu/doc_template")
        docker.withRegistry('https://registry.hub.docker.com/', 'dockerHubCredentials') {
            dockerImage.push("latest")
        }
    }
}

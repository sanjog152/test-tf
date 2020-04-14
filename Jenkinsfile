pipeline {
 agent {
  docker {
   image 'hashicorp/terraform'
   args '--entrypoint='
  }
 }

 environment {
  VAR_FILE = "vars/test.tvars"
 }

 stages {
  stage('Checkout') {
   steps {
    checkout scm
   }
  }
  stage('Terraform Plan') {
   steps {
    sh 'terraform init'
    sh 'terraform  plan -var-file=${VAR_FILE} -out myplan'
   }
  }
  stage('Approval') {
   steps {
    script {
     def userInput = input(id: 'proceed', message: 'Apply Terraform?', parameters: [
      [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'proceed']
     ])
    }
   }
  }
  stage('Terraform Apply') {
   steps {
    sh 'terraform apply  -input=false myplan'
   }
  }
 }
}

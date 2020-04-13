pipeline {

    agent {
        docker {
            image 'hashicorp/terraform'
            args '--entrypoint='
        }
    }

  environment {
    Token = "Test"
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
          sh 'terraform plan -out myplan'
        
      }      
    }

    stage('Approval') {
      steps {
        script {
          def userInput = input(id: 'accepted', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'accepted'] ])
        }
      }
    }

    stage('Terraform Apply') {
      steps {
          sh 'terraform apply -input=false myplan'
      }
    }

  } 

}

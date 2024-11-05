pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        // Checkout code from the GitHub repository
        git branch: 'main', url: 'https://github.com/A01Mlner/lbg-vat-calculator.git'
      }
    }

    stage('Install') {
      steps {
        // Install ReactJS dependencies
        sh "npm install"
      }
    }

    stage('Test') {
      steps {
        // Run the ReactJS tests
        sh "npm test"
      }
    }

    stage('SonarQube Analysis') {
      environment {
        scannerHome = tool 'sonarqube'  // SonarQube scanner tool configuration
      }
      steps {
        withSonarQubeEnv('sonar-qube-1') {        
          // Perform the SonarQube analysis
          sh "${scannerHome}/bin/sonar-scanner"
        }
        // Timeout for the quality gate check
        timeout(time: 10, unit: 'MINUTES') {
          waitForQualityGate abortPipeline: true
        }
      }
    }

    // Optional stage to run the app using `npm start`
    stage('Start App') {
      steps {
        script {
          // Running npm start to start the application
          echo 'Starting the app...'
          sh "screen -dmS myapp npm start"
        }
      }
    }
  }
}

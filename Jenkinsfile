pipeline {
	agent any

	environment {
		IMAGE_NAME = "spring-boot-app"
		CONTAINER_NAME = "jenkins-test"
		MAVEN = 'maven_3_9_11'
	}

	stages {
		stage('Checkout & Build') {
			steps {
				script {
					echo 'Kod repodan yuklanmoqda...'
					git branch: 'master', url: 'https://github.com/AbbosbekNorinboyev/jenkins_test'
				}
			}
		}

		stage('Build') {
			steps {
				script {
					echo 'Maven orqali loyihani build qilinmoqda...'
					sh 'mvn clean package -DskipTests'
				}
			}
		}

		stage('Test') {
			steps {
				echo 'Testlarni ishga tushirish...'
				sh 'mvn test'
			}
		}

		stage('Docker build') {
			steps {
				script {
					echo 'Docker image yaratilmoqda...'
					sh "docker build -t ${IMAGE_NAME} ."
				}
			}
		}

		stage('Deploy with Docker Compose') {
			steps {
				script {
					echo 'Docker Compose orqali ilova ishga tushirilmoqda...'
					sh """
                        docker-compose down
                        docker-compose up -d --build
                    """
				}
			}
		}
	}

	post {
		success {
			echo 'Deployment muvaffaqiyatli yakunlandi'
		}
		failure {
			echo 'Deploymentda xatolik yuz berdi'
		}
	}
}

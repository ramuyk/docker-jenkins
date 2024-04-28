# Introduction

This repository provides a `docker-compose.yml` ready-to-use Docker configuration to simplify the deployment of the official Jenkins Docker container. For comprehensive details about extra configurations, please refer to the [Jenkins official Docker installation guide](https://www.jenkins.io/doc/book/installing/linux/).

## Repository Contents

This repository contains:

- **Docker Compose File**: A `docker-compose.yml` file that configures the Jenkins Docker container. Highlights of this setup include:
  - **Persistent Data Storage**: Ensures that Jenkins configuration and data are retained across container restarts.
  - **Timezone Configuration**: The container is configured to use the São Paulo timezone (`America/Sao_Paulo`) by default. Adjust the `TZ` environment variable in the `docker-compose.yml` file if a different timezone is desired.
- **Dockerfile**: A `Dockerfile` that specifies the custom `jenkins-prod` Docker image build process. This file is essential for installing system libraries and tools, such as npm and the Ionic CLI, which are required for web development capabilities within Jenkins.

## Getting Started

### Quick Setup

1. **Clone the Repository**:
   Clone this repository to your local machine using the following Git command:
   ```bash
   git clone https://github.com/ramuyk/docker-jenkins.git
   cd docker-jenkins
   ```

2. **Build and Start Jenkins**:
   Use the following command to build the Jenkins image and start the service:
   ```bash
   docker-compose up -d --build
   ```

3. **Access Jenkins**:
   Open a web browser and navigate to `http://localhost:10010` to access the Jenkins web interface. The initial setup wizard will guide you through the configuration process, including setting up the admin user and installing essential plugins.

### Configuration Details

#### Data Persistence

The `docker-compose.yml` file configures a volume `jenkins_data` at `/var/jenkins_home` to store Jenkins data persistently. This setup ensures that your Jenkins configurations, job definitions, and build history are preserved when the container is restarted.

#### Node.js and Ionic Support

The custom Docker image includes npm and the Ionic CLI, pre-installed and configured. This enables Jenkins to manage and build Node.js and Ionic-based projects directly within the Docker container.

## Customization

### Modifying Jenkins Configuration

You can modify the `Dockerfile` and `docker-compose.yml` to include additional Jenkins plugins, install system libraries, or change environment variables according to your requirements.

### Updating Jenkins

To update Jenkins to a newer version, update the Docker image in the Dockerfile, rebuild the image, and restart the container with the updated configuration.


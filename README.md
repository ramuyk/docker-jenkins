# Introduction

This repository provides a `docker-compose.yml` ready-to-use Docker configuration to simplify the deployment of the official Jenkins Docker container. For comprehensive details about extra configurations, please refer to the [Jenkins official Docker installation guide](https://www.jenkins.io/doc/book/installing/linux/).

## Repository Contents

This repository contains:

- **Docker Compose File**: A `docker-compose.yml` file that configures the Jenkins Docker container. Highlights of this setup include:
  - **Persistent Data Storage**: The `docker-compose.yml` file configures a volume `jenkins_data` at `/var/jenkins_home` to store Jenkins data persistently. This setup ensures that Jenkins configurations, job definitions, and build history are preserved when the container is restarted.
- **Dockerfile**: A `Dockerfile` that specifies the custom `jenkins-prod` Docker image build process. This file is essential for installing system libraries and tools, such as npm and the Ionic CLI, which are required for web development capabilities within Jenkins. Feel free to customize this Dockerfile to meet your specific needs.

## Getting Started

### Important Preliminary Steps

Before starting the quick setup, please note the following adjustments:

1. **Important Note on Port Mapping**: The `docker-compose.yml` file contains a port mapping to `127.0.0.1`, limiting access to the localhost only. To make the service accessible from other machines or publicly, change the IP address in the port mapping. For instance, use `0.0.0.0` to bind to all network interfaces, updating the ports line to `- "0.0.0.0:8088:8088"` for broader network access.

2. **Resource Limits**: The Docker container is configured to use a maximum of 8 GB of RAM and 4 CPU cores, optimizing performance while preventing overutilization of host resources. These settings can be adjusted inside the `docker-compose.yml` file to suit your specific needs or to align with the capabilities of your system.

3. **Timezone Configuration**: The container is configured to use the São Paulo timezone (`America/Sao_Paulo`) by default. Adjust the `TZ` environment variable in the `docker-compose.yml` file if a different timezone is desired.

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
   docker compose up -d --build 
   ```

3. **Access Jenkins**:
   Open a web browser and navigate to `http://localhost:10010` to access the Jenkins web interface. The initial setup wizard will guide you through the configuration process, including setting up the admin user and installing essential plugins.


# CSP Docker

## Overview

This project provides a Docker-based environment for testing and experimenting with Content Security Policies (CSP) in Nginx.

This setup allows developers to quickly modify HTML, CSS, and Nginx configuration files, with immediate reflection of
changes in the running container. It's designed for ease of use, making it an ideal tool for experimentation.

## Get Started

### Prerequisites

Before getting started, ensure you have the following installed on your machine:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

### Quick Start

**Clone the Repository**:

```shell
git clone https://github.com/nizos/csp-docker.git
cd csp-docker
```

**Build and Start the Docker Container**:

Run the following command to build the Docker image and start the container:

```shell
docker-compose up --build -d
```

This command will:

- Build the Docker image if it's not already built.
- Start the container in detached mode, with the necessary files and configurations mounted as volumes.

Once the container is running, you can access the application by navigating to [localhost:8080](http://localhost:8080) in your web browser.

## Usage

### Making Changes

#### HTML & CSS 

Any changes you make to the files in the `site` directory (`index.html`, `style.css`) will be automatically updated in the running container.

#### Nginx Configuration

If you edit the `nginx.conf` file in the `nginx` directory, you'll need to reload Nginx to apply the changes.

### To Reload Nginx

After editing the Nginx configuration file, reload Nginx with:

```shell
docker exec csp-container nginx -s reload
```

### To Exec into the Container

If you need to access the container's shell, use the following command:

```shell
docker exec -it csp-container /bin/sh
```

This command opens an interactive shell session inside the running container.

## Tips and Tricks

### Calculating the SHA-256 Hash of a File

To set up a CSP with specific hashes, you may need to calculate the SHA-256 hash of a file.
Here’s how to do it on different operating systems:

#### On Linux and macOS:

```shell
openssl dgst -sha256 -binary yourfile.txt | openssl base64
```

#### On Windows (using PowerShell):

```shell
Get-FileHash yourfile.txt -Algorithm SHA256 | ForEach-Object { [convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($_.Hash)) }
```

### Helpful Resources

- [Nginx Documentation](https://nginx.org/en/docs/)
- [Docker Documentation](https://docs.docker.com/)
- [Content Security Policy (CSP) Guide](https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP)
- [CSP Evaluator](https://csp-evaluator.withgoogle.com/)

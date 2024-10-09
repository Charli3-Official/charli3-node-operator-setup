# Accessing the Node Operator Backend Docker Image from GitHub Container Registry

This guide provides instructions on how to access and utilize the `node-operator-backend` Docker image from the GitHub Container Registry (ghcr.io).

## Step 1: Pull the Node Operator Backend Docker Image

Since the image is public, you can pull it directly without any authentication:

```bash
docker pull ghcr.io/charli3-official/charli3-node-operator-backend:latest
```

Replace `latest` with a specific tag if you need a particular version.

## Step 2: Verify the Downloaded Image

Check that the Docker image is successfully downloaded to your local Docker environment:

```bash
docker images
```

Look for `ghcr.io/charli3-official/charli3-node-operator-backend` in the list to confirm its presence.

## Step 3: Run the Docker Image

Start a container using the `node-operator-backend` image with the following command, adjusting it based on any specific configurations or environment variables your setup requires:

```bash
docker run -it ghcr.io/charli3-official/charli3-node-operator-backend:latest
```

## Step 4: Check Container Logs (Optional)

If you need to troubleshoot or verify that the application is functioning as expected, view logs from the running container. First, identify your container ID with `docker ps` and then use `docker logs`:

```bash
docker ps
docker logs [CONTAINER_ID]
```

## Using the Image with Docker Compose

In most cases, you'll be using this image as part of a Docker Compose setup. In your `docker-compose.yml` file, reference the image like this:

```yaml
services:
  charli3-node-operator:
    image: ghcr.io/charli3-official/charli3-node-operator-backend:latest
    # ... other configuration options ...
```

## Updating the Image

To update to the latest version of the image:

1. Pull the latest image:
   ```bash
   docker pull ghcr.io/charli3-official/charli3-node-operator-backend:latest
   ```

2. If using Docker Compose, rebuild and restart your services:
   ```bash
   docker-compose down
   docker-compose up -d
   ```

## Troubleshooting

If you encounter issues pulling or running the image:

1. Ensure you have a stable internet connection.
2. Verify that you have sufficient permissions to pull Docker images.
3. Check that your Docker installation is up to date.
4. If the issue persists, contact the Charli3 support team for assistance.

Remember to always refer to the official Charli3 documentation for the most up-to-date information on image versions and configuration requirements.

This guide provides a straightforward approach to accessing and managing the `node-operator-backend` Docker image from GitHub Container Registry using Docker commands, ensuring a quick and easy setup for all users.
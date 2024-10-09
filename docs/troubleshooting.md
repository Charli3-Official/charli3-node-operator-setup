# Troubleshooting Guide for Charli3 Node Operator Backend

This guide provides solutions to common issues you might encounter while operating your Charli3 node. If you can't resolve an issue using this guide, please contact the Charli3 support team.

## 1. Node Won't Start

### Symptoms:
- Docker containers fail to start
- Error messages in Docker logs

### Possible Solutions:
1. Check Docker status:
   ```
   sudo systemctl status docker
   ```
   Ensure Docker is running.

2. Verify Docker Compose file:
   ```
   docker-compose config
   ```
   Look for any configuration errors.

3. Check for port conflicts:
   ```
   sudo netstat -tuln
   ```
   Ensure required ports are not in use by other services.

4. Ensure sufficient disk space:
   ```
   df -h
   ```
   Free up space if necessary.

## 2. Node is Not Syncing with Cardano Blockchain

### Symptoms:
- Node is running but not updating
- Logs show sync errors

### Possible Solutions:
1. Check Cardano node status:
   ```
   docker logs cardano-node
   ```
   Ensure Cardano node is fully synced.

2. Verify Ogmios and Kupo connections:
   Check `dynamic_config.yml` for correct URLs.

3. Restart the node:
   ```
   docker-compose down
   docker-compose up -d
   ```

## 3. Oracle Feed Not Updating

### Symptoms:
- Specific feed container is running but not submitting updates
- Logs show data fetching errors

### Possible Solutions:
1. Check feed-specific logs:
   ```
   docker logs charli3-[feed-name]-v3
   ```
   Look for API or processing errors.

2. Verify feed configuration:
   Review the feed-specific config file (e.g., `ada_usd_v3_config.yml`).

3. Ensure sufficient ADA balance:
   Check wallet balance for transaction fees.

4. Restart the specific feed container:
   ```
   docker-compose restart charli3-[feed-name]-v3
   ```

## 4. Database Connection Issues

### Symptoms:
- Logs show database connection errors
- Feeds are not storing or retrieving data

### Possible Solutions:
1. Check database container status:
   ```
   docker ps | grep postgres
   ```
   Ensure the database container is running.

2. Verify database connection settings:
   Review `dynamic_config.yml` for correct database URL.

3. Check database logs:
   ```
   docker logs charli3-node-operator-db
   ```
   Look for any error messages.

4. Restart the database container:
   ```
   docker-compose restart charli3-node-operator-db
   ```

## 5. High Resource Usage

### Symptoms:
- Server is slow or unresponsive
- Docker containers are being killed

### Possible Solutions:
1. Check resource usage:
   ```
   docker stats
   ```
   Identify containers using excessive resources.

2. Increase resource limits:
   Modify Docker Compose file to allocate more resources.

3. Optimize server:
   Consider upgrading hardware or optimizing other running processes.

## 6. Network Connectivity Issues

### Symptoms:
- Feeds fail to fetch external data
- Node can't connect to Cardano network

### Possible Solutions:
1. Check network connectivity:
   ```
   ping 8.8.8.8
   ```
   Ensure basic internet connectivity.

2. Verify firewall settings:
   Ensure required ports are open (e.g., 1337 for Ogmios, 1442 for Kupo).

3. Check DNS resolution:
   ```
   nslookup example.com
   ```
   Ensure DNS is working correctly.

## 7. Updating Issues

### Symptoms:
- Errors when pulling new Docker images
- Conflicts after updating

### Possible Solutions:
1. Check for conflicting versions:
   Review the changelog for any breaking changes.

2. Clean Docker cache:
   ```
   docker system prune
   ```
   Remove unused data.

3. Manually pull images:
   ```
   docker pull ghcr.io/charli3-official/charli3-node-operator-backend:latest
   ```
   Ensure you have the latest image.

## 8. Alert Configuration Issues

### Symptoms:
- Not receiving expected alerts
- Receiving too many alerts
- Alerts not being sent to the configured channels

### Possible Solutions:
1. Verify alert configuration in `dynamic_config.yml`:
   ```bash
   cat dynamic_config.yml | grep -A 10 Alerts
   ```
   Ensure all fields are correctly set.

2. Check notification service connectivity:
   - For Slack/Discord: Verify webhook URL
   - For Telegram: Check bot token and chat ID

3. Adjust alert thresholds if receiving too many alerts:
   ```yaml
   Alerts:
     thresholds:
       c3_token_balance: 150  # Increase this value
   ```

4. Verify the cooldown period if alerts are too frequent:
   ```yaml
   Alerts:
     cooldown: 3600  # Increase to reduce frequency (in seconds)
   ```

5. Restart the node after configuration changes:
   ```bash
   docker-compose down
   docker-compose up -d
   ```

## 9. pgbouncer Connection Issues

### Symptoms:
- Database connection errors in logs
- Slow query performance
- "too many clients" errors

### Possible Solutions:
1. Check pgbouncer container status:
   ```bash
   docker-compose ps pgbouncer
   ```

2. Verify pgbouncer configuration:
   ```bash
   docker-compose exec pgbouncer cat /opt/bitnami/pgbouncer/conf/pgbouncer.ini
   ```

3. Check pgbouncer logs:
   ```bash
   docker-compose logs pgbouncer
   ```

4. Adjust max_client_conn if seeing "too many clients" errors:
   In `docker-compose.yml`, update the pgbouncer environment:
   ```yaml
   pgbouncer:
     environment:
       - PGBOUNCER_MAX_CLIENT_CONN=1000
   ```

5. Restart pgbouncer:
   ```bash
   docker-compose restart pgbouncer
   ```

6. If issues persist, try connecting directly to the database to isolate the problem:
   ```bash
   docker-compose exec charli3-node-operator-db psql -U charli3 -d node-operator-backend
   ```

## General Troubleshooting Steps

1. Always check the logs first:
   ```
   docker-compose logs
   ```
   Look for error messages or warnings.

2. Restart the problematic service:
   ```
   docker-compose restart [service-name]
   ```

3. If all else fails, try a full restart:
   ```
   docker-compose down
   docker-compose up -d
   ```

4. Keep your system updated:
   Regularly update Docker, Docker Compose, and your operating system.

Remember, if you're unable to resolve an issue using this guide, don't hesitate to reach out to the Charli3 support team. Provide them with relevant logs and a detailed description of the problem for faster resolution.
# Virtual Pet Application

This repository contains the Virtual Pet application, a microservices-based system for managing virtual pets.

## Infrastructure Setup

The application uses Docker Compose to set up all the necessary infrastructure components. The following components are included:

### Database Services

- **MongoDB**: Document database for storing pet data and other application data
- **PostgreSQL**: Relational database used by Keycloak for authentication data

### Authentication Service

- **Keycloak**: External identity and access management solution that handles user authentication, authorization, and identity management

### Observability Stack

- **Grafana**: Visualization and dashboards for metrics, logs, and traces
- **Prometheus**: Metrics collection and storage
- **Loki**: Log aggregation and storage
- **Promtail**: Log collection agent
- **Tempo**: Distributed tracing system
- **Node Exporter**: Host metrics exporter
- **cAdvisor**: Container metrics exporter
- **Alertmanager**: Alert management and notification

## Getting Started

### Prerequisites

- Docker and Docker Compose installed on your system
- Git for version control

### Running the Infrastructure

1. Clone the repository:
   ```
   git clone https://github.com/yourusername/virtual_pet.git
   cd virtual_pet
   ```

2. Start the infrastructure:
   ```
   docker-compose up -d
   ```

3. Access the services:
   - Keycloak: http://localhost:8080 (Admin console: http://localhost:8080/admin, username: admin, password: admin)
   - Grafana: http://localhost:3000 (username: admin, password: admin)
   - Prometheus: http://localhost:9090
   - Loki: http://localhost:3100
   - Tempo: http://localhost:3200
   - Alertmanager: http://localhost:9093

### Stopping the Infrastructure

To stop all services:
```
docker-compose down
```

To stop all services and remove volumes (this will delete all data):
```
docker-compose down -v
```

## Development

### Microservices

The application consists of the following microservices:

- **API Gateway**: Central entry point for all client requests
- **Discovery Service**: Service registry for microservices
- **Configuration Service**: Centralized configuration management
- **User Service**: Manages user profiles and preferences
- **Pet Service**: Core service for managing virtual pets
- **Payment Service**: Handles payments and subscriptions
- **Backoffice Service**: Administrative functionality

### Building and Running Microservices

Each microservice can be built and run using the provided Makefile:

```
# Build all services
make build

# Build a specific service
make build-<service-name>

# Run a specific service
make run-<service-name>

# Run tests for a specific service
make test-<service-name>
```

## Configuration

### Prometheus Configuration

Prometheus is configured to scrape metrics from all services. The configuration file is located at `prometheus/prometheus.yml`.

### Loki and Promtail Configuration

Loki is configured to receive logs from Promtail. Promtail is configured to collect logs from the host system and Docker containers. The configuration file is located at `promtail/promtail-config.yml`.

### Tempo Configuration

Tempo is configured to receive traces from the application services. The configuration file is located at `tempo/tempo-config.yml`.

### Alertmanager Configuration

Alertmanager is configured to manage alerts from Prometheus. The configuration file is located at `alertmanager/alertmanager.yml`.

## License

This project is licensed under the terms of the license included in the repository.
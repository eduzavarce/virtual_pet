# Makefile for Virtual Pet Project
# This Makefile provides convenient shortcuts for common operations

# Define the default shell
SHELL := /bin/bash

# Define the Gradle wrapper command
GRADLE := ./gradlew

# Define the services
SERVICES := configuration discovery gateway

# Default target
.PHONY: all
all: build

# Help command
.PHONY: help
help:
	@echo "Virtual Pet Project Makefile"
	@echo "============================"
	@echo "Available commands:"
	@echo "  make                 - Build all services (same as 'make build')"
	@echo "  make build           - Build all services"
	@echo "  make build-SERVICE   - Build a specific service (e.g., make build-configuration)"
	@echo "  make clean           - Clean all build artifacts"
	@echo "  make clean-SERVICE   - Clean a specific service (e.g., make clean-configuration)"
	@echo "  make test            - Run tests for all services"
	@echo "  make test-SERVICE    - Run tests for a specific service (e.g., make test-configuration)"
	@echo "  make run-SERVICE     - Run a specific service (e.g., make run-configuration)"
	@echo "  make bootJar         - Create executable JARs for all services"
	@echo "  make bootJar-SERVICE - Create executable JAR for a specific service"
	@echo "  make help            - Show this help message"
	@echo ""
	@echo "Available services: $(SERVICES)"

# Build all services
.PHONY: build
build:
	$(GRADLE) build -x test

# Build a specific service
.PHONY: $(addprefix build-,$(SERVICES))
$(addprefix build-,$(SERVICES)):
	$(GRADLE) :$(subst build-,,$@):build -x test

# Clean all build artifacts
.PHONY: clean
clean:
	$(GRADLE) clean

# Clean a specific service
.PHONY: $(addprefix clean-,$(SERVICES))
$(addprefix clean-,$(SERVICES)):
	$(GRADLE) :$(subst clean-,,$@):clean

# Run tests for all services
.PHONY: test
test:
	$(GRADLE) test

# Run tests for a specific service
.PHONY: $(addprefix test-,$(SERVICES))
$(addprefix test-,$(SERVICES)):
	$(GRADLE) :$(subst test-,,$@):test

# Run a specific service
.PHONY: $(addprefix run-,$(SERVICES))
$(addprefix run-,$(SERVICES)):
	$(GRADLE) :$(subst run-,,$@):bootRun

# Create executable JARs for all services
.PHONY: bootJar
bootJar:
	$(GRADLE) bootJar

# Create executable JAR for a specific service
.PHONY: $(addprefix bootJar-,$(SERVICES))
$(addprefix bootJar-,$(SERVICES)):
	$(GRADLE) :$(subst bootJar-,,$@):bootJar
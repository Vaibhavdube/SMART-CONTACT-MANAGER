# Use official OpenJDK image (Java 17)
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy Maven wrapper and pom.xml first
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# Download dependencies (caching layer)
RUN ./mvnw dependency:go-offline

# Copy the rest of the project
COPY src ./src

# Build the app (skip tests)
RUN ./mvnw clean package -DskipTests

# Expose port
EXPOSE 8080

# Start the app
CMD ["java", "-jar", "target/smart-contact-manager-0.0.1-SNAPSHOT.jar"]

# Use official OpenJDK image
FROM openjdk:17-jdk-slim

WORKDIR /app

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# Make mvnw executable
RUN chmod +x mvnw

# Download dependencies offline
RUN ./mvnw dependency:go-offline

# Copy source code
COPY src ./src

# Build the app, skip tests
RUN ./mvnw clean package -DskipTests

# Expose port
EXPOSE 8080

# Start Spring Boot app
CMD ["java", "-jar", "target/smart-contact-manager-0.0.1-SNAPSHOT.jar"]



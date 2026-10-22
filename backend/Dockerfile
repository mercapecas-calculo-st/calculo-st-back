# =====================================================================
# Stage 1: build
# =====================================================================
FROM eclipse-temurin:25-jdk AS build
WORKDIR /app

# Copia pom.xml primeiro para cachear a resolução de dependências
COPY pom.xml .
# Copia o código-fonte depois (invalida o cache só se src/ mudar)
COPY src ./src

# Build com cache do repositório Maven local entre builds
RUN --mount=type=cache,target=/root/.m2 \
    mvn -B -q package -DskipTests

# =====================================================================
# Stage 2: runtime
# =====================================================================
FROM eclipse-temurin:25-jre
WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

# Healthcheck: o Docker Compose usa para condition: service_healthy
HEALTHCHECK --interval=15s --timeout=5s --start-period=40s --retries=5 \
  CMD wget -qO- http://localhost:8080/actuator/health || exit 1

# Exec form: permite que SIGTERM chegue ao processo Java (graceful shutdown)
ENTRYPOINT ["java", "-jar", "/app/app.jar"]

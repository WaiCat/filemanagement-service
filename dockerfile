FROM eclipse-temurin:17-jdk-jammy as build
WORKDIR /workspace/app

# Gradle 파일 복사
COPY gradle gradle
COPY gradlew .
COPY build.gradle .
COPY settings.gradle .

# Gradle 의존성 캐시 활용
RUN ./gradlew dependencies

# 소스 코드 복사 및 빌드
COPY src src
RUN ./gradlew build -x test

# 실행 이미지
FROM eclipse-temurin:17-jre-jammy
VOLUME /tmp
COPY --from=build /workspace/app/build/libs/*.jar app.jar

# 환경변수 선언 (값은 docker-compose.yml에서 주입)
ENV SPRING_PROFILES_ACTIVE=default
ENV DB_HOST=localhost
ENV DB_PORT=5432
ENV DB_NAME=contactdb
ENV DB_USERNAME=postgres
ENV DB_PASSWORD=postgres
ENV AWS_ACCESS_KEY=your-access-key
ENV AWS_SECRET_KEY=your-secret-key
ENV AWS_REGION=ap-northeast-2
ENV AWS_S3_BUCKET=your-bucket-name
ENV AWS_S3_BASE_URL=https://your-bucket-name.s3.ap-northeast-2.amazonaws.com

ENTRYPOINT ["java", "-jar", "/app.jar"]

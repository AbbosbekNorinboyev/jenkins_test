# 1️⃣ Bosqich: Build stage (Maven bilan .jar faylni yig‘ish)
FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app

# faqat dependency kechiktirilmasin deb, pom.xml avvaldan copy qilamiz
COPY pom.xml .
RUN mvn dependency:go-offline

# endi butun source kodni copy qilamiz
COPY src ./src

# .jar faylni build qilamiz
RUN mvn clean package -DskipTests

# 2️⃣ Bosqich: Run stage (yengil JRE image)
FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app

# build bosqichidan .jar faylni ko‘chirib olamiz
COPY target/app-test.jar  /app/app-test.jar

# portni ochamiz
EXPOSE 4444

# JVM uchun ba’zi optimizatsiyalar (ixtiyoriy, lekin tavsiya etiladi)
ENV JAVA_OPTS="-XX:+UseContainerSupport -XX:MaxRAMPercentage=75.0"

ENTRYPOINT ["java", "-jar", "/app/app-test.jar"]
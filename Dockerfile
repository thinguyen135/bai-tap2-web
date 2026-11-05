# Stage 1: Build mã nguồn bằng Maven
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app

# Copy pom.xml và thư mục mã nguồn
COPY pom.xml .
COPY src ./src

# Tiến hành build file .war
RUN mvn clean package -DskipTests

# Stage 2: Chạy ứng dụng trên Tomcat 10.1 (Tương thích Jakarta EE 10 / Servlet 6.0)
FROM tomcat:10.1-jdk17

# Dọn dẹp các ứng dụng mẫu mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file .war sinh ra từ stage build vào thư mục webapps dưới tên ROOT.war (chạy ở trang chủ localhost:8080)
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]


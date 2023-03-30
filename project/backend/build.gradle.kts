plugins {
	java
	id("org.springframework.boot") version "2.5.6"
	id("io.spring.dependency-management") version "1.1.0"
}

group = "com.mws_kb"
version = "0.0.1-SNAPSHOT"
java {
    sourceCompatibility = JavaVersion.VERSION_17
    targetCompatibility = JavaVersion.VERSION_17
}

repositories {
	mavenCentral()
}

dependencies {
	implementation("org.springframework.boot:spring-boot-starter-data-jpa")
	implementation("org.springframework.boot:spring-boot-starter-web")
	implementation("com.google.firebase:firebase-admin:8.0.1")
	implementation("com.google.cloud.sql:mysql-socket-factory-connector-j-8:1.2.3")
	implementation("io.github.cdimascio:dotenv-java:2.2.0")
	runtimeOnly("com.mysql:mysql-connector-j")
	testImplementation("org.springframework.boot:spring-boot-starter-test")
}

tasks.withType<Test> {
	useJUnitPlatform()
}

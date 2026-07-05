package com.example.teachersms;

import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import javax.sql.DataSource;
import java.sql.Connection;

@SpringBootApplication
public class TeachersmsApplication {
	@Autowired
	private DataSource dataSource;

	@PostConstruct
	public void test() throws Exception {
		Connection con = dataSource.getConnection();

		System.out.println("User = " + con.getMetaData().getUserName());
		System.out.println("URL = " + con.getMetaData().getURL());
	}

	public static void main(String[] args) {
		SpringApplication.run(TeachersmsApplication.class, args);
	}

}

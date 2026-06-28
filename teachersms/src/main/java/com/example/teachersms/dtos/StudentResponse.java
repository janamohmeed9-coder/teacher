package com.example.teachersms.dtos;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDate;

@Data
@Builder
public class StudentResponse {

    private Long studentId;
    private String firstname;
    private String lastName;

    private LocalDate birthDate;

    private String email;

    private Long phoneNumber;

    private String className;

    private String gradeName;
}
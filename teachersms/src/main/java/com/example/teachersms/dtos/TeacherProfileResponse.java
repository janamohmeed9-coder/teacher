package com.example.teachersms.dtos;

import lombok.*;

import java.time.LocalDate;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TeacherProfileResponse{

    private String firstName;
    private String lastName;
    private String email;
    private String address;
    private String firstNameInArabic;
    private String lastNameInArabic;
    private String education;
    private String employmentHistory;
    private Long numberOfYearsOfExperience;
    private Long phoneNumber;
    private Long nationalNumber;
    private LocalDate birthDate;
}
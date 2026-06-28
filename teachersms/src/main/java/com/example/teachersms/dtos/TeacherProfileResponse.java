package com.example.teachersms.dtos;

import lombok.*;

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
}
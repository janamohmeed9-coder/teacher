package com.example.teachersms.services;

import com.example.teachersms.dtos.TeacherProfileResponse;
import com.example.teachersms.dtos.UpdateProfileRequest;
import com.example.teachersms.entities.Teacher;
import com.example.teachersms.entities.User;
import com.example.teachersms.repositories.TeacherRepository;
import com.example.teachersms.repositories.UserRepository;
import com.example.teachersms.security.AuthenticationService;
import com.example.teachersms.security.CustomUserDetails;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class TeacherServices {

    private final TeacherRepository teacherRepository;
    private final UserRepository userRepository;
    private final AuthenticationService authenticationService;

    public TeacherProfileResponse getTeacherProfile() {


        User user = authenticationService.getUser();

        Teacher teacher = teacherRepository.findByUser(user)
                .orElseThrow(() -> new RuntimeException("Teacher not found"));

        return TeacherProfileResponse.builder()
                .firstName(user.getFirstName())
                .lastName(user.getLastName())
                .email(user.getEmail())
                .address(user.getAddress())
                .firstNameInArabic(user.getFirstNameInArabic())
                .lastNameInArabic(user.getLastNameInArabic())
                .education(teacher.getEducation())
                .employmentHistory(teacher.getEmploymentHistory())
                .numberOfYearsOfExperience(teacher.getNumberOfYearsOfExperience())
                .build();
    }

    public TeacherProfileResponse updateProfile(UpdateProfileRequest request) {

        User user = authenticationService.getUser();

        Teacher teacher = teacherRepository.findByUser(user)
                .orElseThrow(() -> new RuntimeException("Teacher not found"));

        user.setFirstName(request.getFirstName());
        user.setLastName(request.getLastName());

        userRepository.save(user);

        return TeacherProfileResponse.builder()
                .firstName(user.getFirstName())
                .lastName(user.getLastName())
                .email(user.getEmail())
                .address(user.getAddress())
                .firstNameInArabic(user.getFirstNameInArabic())
                .lastNameInArabic(user.getLastNameInArabic())
                .education(teacher.getEducation())
                .employmentHistory(teacher.getEmploymentHistory())
                .numberOfYearsOfExperience(teacher.getNumberOfYearsOfExperience())
                .build();
    }
}
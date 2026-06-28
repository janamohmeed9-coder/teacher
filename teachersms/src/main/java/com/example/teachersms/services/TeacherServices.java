package com.example.teachersms.services;

import com.example.teachersms.dtos.TeacherProfileResponse;
import com.example.teachersms.dtos.UpdateProfileRequest;
import com.example.teachersms.entities.Teacher;
import com.example.teachersms.entities.User;
import com.example.teachersms.repositories.TeacherRepository;
import com.example.teachersms.repositories.UserRepository;
import org.springframework.stereotype.Service;

@Service
public class TeacherServices {
    private TeacherRepository teacherRepository;
   private UserRepository userRepository;
    public TeacherServices(TeacherRepository teacherRepository , UserRepository userRepository) {
        this.teacherRepository = teacherRepository;
        this.teacherRepository=teacherRepository;
    }

    public TeacherProfileResponse getTeacherProfile(Long teacherId){


            Teacher teacher = teacherRepository.findById(teacherId)
                    .orElseThrow(() -> new RuntimeException("Teacher not found"));

            User user = teacher.getUser();

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



    public TeacherProfileResponse updateProfile(Long teacherId,
                                                UpdateProfileRequest request) {

        Teacher teacher = teacherRepository.findById(teacherId)
                .orElseThrow(() -> new RuntimeException("Teacher not found"));

        User user = teacher.getUser();

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

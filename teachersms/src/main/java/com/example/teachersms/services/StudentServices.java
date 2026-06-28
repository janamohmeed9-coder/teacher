package com.example.teachersms.services;

import com.example.teachersms.dtos.StudentResponse;
import com.example.teachersms.entities.Student;
import com.example.teachersms.entities.User;
import com.example.teachersms.repositories.StudentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class StudentServices {

    private final StudentRepository studentRepository;

    public StudentResponse getStudent(Long studentId){

        Student student = studentRepository.findById(studentId)
                .orElseThrow(() -> new RuntimeException("Student not found"));

        User user = student.getUser();

        return StudentResponse.builder()
                .studentId(student.getId())
                .birthDate(user.getBirthDate())
                .email(user.getEmail())
//            .phoneNumber(.....)
//        .className(.....)
//        .gradeName(.....)
                .build();



    }



}
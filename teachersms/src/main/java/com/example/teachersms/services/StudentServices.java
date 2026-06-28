package com.example.teachersms.services;

import com.example.teachersms.dtos.StudentResponse;
import com.example.teachersms.entities.Student;
import com.example.teachersms.entities.User;
import com.example.teachersms.repositories.StudentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

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
//            .phoneNumber()
//        .className()
//        .gradeName()
                .build();



    }

    public List<StudentResponse> getAllStudents() {

        List<Student> students = studentRepository.findAll();

        return students.stream()
                .map(student -> StudentResponse.builder()
                        .studentId(student.getId())
                        .firstname(student.getUser().getFirstName())
                        .lastName(student.getUser().getLastName())
                        .gradeName("")
                        .build())
                .toList();
    }


}
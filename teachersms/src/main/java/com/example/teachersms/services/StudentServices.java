package com.example.teachersms.services;

import com.example.teachersms.dtos.StudentResponse;
import com.example.teachersms.entities.Student;
import com.example.teachersms.entities.User;
import com.example.teachersms.entities.UserPhoneNumberId;
import com.example.teachersms.repositories.MarkRepository;
import com.example.teachersms.repositories.StudentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class StudentServices {

    private final StudentRepository studentRepository;
    private final MarkRepository markRepository;

    public StudentResponse getStudent(Long studentId) {

        Student student = studentRepository.findById(studentId)
                .orElseThrow(() -> new RuntimeException("Student not found"));

        User user = student.getUser();

        Long phoneNumber = user.getPhoneNumbers()
                .stream()
                .findFirst()
                .map(phone -> phone.getId().getPhoneNumber())
                .orElse(null);

        return StudentResponse.builder()
                .studentId(student.getId())
                .firstname(user.getFirstName())
                .lastName(user.getLastName())
                .birthDate(user.getBirthDate())
                .email(user.getEmail())
                .phoneNumber(phoneNumber)
                .className(student.getStudentClass().getName())
                .gradeName(student.getStudentClass().getGrade().getName())
                .build();
    }
    public List<StudentResponse> getStudentsByClass(Long classId) {

        return studentRepository.findByStudentClass_Id(classId)
                .stream()
                .map(student -> StudentResponse.builder()
                        .studentId(student.getId())
                        .firstname(student.getUser().getFirstName())
                        .lastName(student.getUser().getLastName())
                        .build())
                .toList();
    }
}
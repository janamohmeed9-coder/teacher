package com.example.teachersms.controllers;

import com.example.teachersms.dtos.StudentResponse;
import com.example.teachersms.services.StudentServices;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/student")
@RequiredArgsConstructor
public class StudentController {

    private final StudentServices studentService;

    @GetMapping("/{id}")
    public StudentResponse getStudent(@PathVariable Long id){
        return studentService.getStudent(id);
    }

    @GetMapping("/class/{classId}")
    public List<StudentResponse> getAllStudents(@PathVariable Long classId) {
        return studentService.getStudentsByClass(classId);
    }
}
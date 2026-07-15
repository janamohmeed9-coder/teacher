package com.example.teachersms.controllers;

import com.example.teachersms.dtos.ClassResponse;
import com.example.teachersms.services.ClassService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/classes")
@RequiredArgsConstructor
public class ClassController {

    private final ClassService classService;

    @GetMapping
    public List<ClassResponse> getClasses() {
        return classService.getClasses();
    }

}
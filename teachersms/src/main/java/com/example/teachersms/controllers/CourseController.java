package com.example.teachersms.controllers;

import com.example.teachersms.dtos.CourseResponse;
import com.example.teachersms.services.CourseService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/courses")
@RequiredArgsConstructor
public class CourseController {

    private final CourseService courseService;

    @GetMapping
    public List<CourseResponse> getCourses(
            @RequestParam(required = false) Long gradeId){

        if(gradeId!=null){
            return courseService.getCoursesByGrade(gradeId);
        }

        return courseService.getAllCourses();
    }

}
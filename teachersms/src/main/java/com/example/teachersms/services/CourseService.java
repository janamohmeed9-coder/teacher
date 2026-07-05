package com.example.teachersms.services;

import com.example.teachersms.dtos.CourseResponse;
import com.example.teachersms.repositories.CourseRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CourseService {

    private final CourseRepository courseRepository;

    public List<CourseResponse> getCoursesByGrade(Long gradeId){

        return courseRepository.findByTerm_Grades_Id(gradeId)
                .stream()
                .map(course -> CourseResponse.builder()
                        .courseId(course.getId())
                        .courseName(course.getCourseName())
                        .build())
                .toList();
    }

    public List<CourseResponse> getAllCourses(){

        return courseRepository.findAll()
                .stream()
                .map(course -> CourseResponse.builder()
                        .courseId(course.getId())
                        .courseName(course.getCourseName())
                        .build())
                .toList();
    }

}
package com.example.teachersms.services;

import com.example.teachersms.dtos.AssignmentResponse;
import com.example.teachersms.entities.Assignment;
import com.example.teachersms.entities.Course;
import com.example.teachersms.entities.Grade;
import com.example.teachersms.repositories.AssignmentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class AssignmentService {

    private final AssignmentRepository assignmentRepository;


    public List<AssignmentResponse> getAssignments() {

        return assignmentRepository.findAll()
                .stream()
                .map(this::mapToResponse)
                .toList();
    }


    public List<AssignmentResponse> searchAssignments(String name) {

        return assignmentRepository.findByNameContainingIgnoreCase(name)
                .stream()
                .map(this::mapToResponse)
                .toList();
    }


    public List<AssignmentResponse> filterAssignments(Long gradeId) {

        return assignmentRepository.findByCourses_Term_Grades_Id(gradeId)
                .stream()
                .map(this::mapToResponse)
                .toList();
    }


    private AssignmentResponse mapToResponse(Assignment assignment) {

        String gradeName = "";

        if (!assignment.getCourses().isEmpty()) {

            Course course = assignment.getCourses().iterator().next();

            if (!course.getTerm().getGrades().isEmpty()) {

                Grade grade = course.getTerm().getGrades().iterator().next();

                gradeName = grade.getName();
            }
        }

        return AssignmentResponse.builder()
                .assignmentId(assignment.getId())
                .assignmentName(assignment.getName())
                .assignDate(assignment.getAssignDate())
                .deadline(assignment.getDeadline())
                .gradeName(gradeName)
                .build();
    }
}
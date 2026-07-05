package com.example.teachersms.services;

import com.example.teachersms.dtos.AssignmentRequest;
import com.example.teachersms.dtos.AssignmentResponse;
import com.example.teachersms.entities.Assignment;
import com.example.teachersms.entities.Course;
import com.example.teachersms.entities.Grade;
import com.example.teachersms.repositories.AssignmentRepository;
import com.example.teachersms.repositories.CourseRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
@RequiredArgsConstructor
public class AssignmentService {

    private final AssignmentRepository assignmentRepository;
    private final CourseRepository courseRepository;

    public AssignmentResponse createAssignment(AssignmentRequest request){

        Course course = courseRepository.findById(request.getCourseId())
                .orElseThrow(() -> new RuntimeException("Course not found"));

        Assignment assignment = new Assignment();

        assignment.setName(request.getAssignmentName());
        assignment.setDescription(request.getDescription());
        assignment.setDeadline(request.getDeadline());

        assignment.setAssignDate(LocalDate.now());

      assignment.setStudentSubmission("");

        if(request.getFile()!=null && !request.getFile().isEmpty()){

            assignment.setFileLink(request.getFile().getOriginalFilename());

        }

        assignmentRepository.save(assignment);

        course.getAssignments().add(assignment);

        courseRepository.save(course);

        return mapToResponse(assignment);

    }

    public List<AssignmentResponse> getAssignments(){

        return assignmentRepository.findAll()
                .stream()
                .map(this::mapToResponse)
                .toList();
    }

    private AssignmentResponse mapToResponse(Assignment assignment){

        String gradeName="";

        if(!assignment.getCourses().isEmpty()){

            Course course=assignment.getCourses().iterator().next();

            if(!course.getTerm().getGrades().isEmpty()){

                Grade grade=course.getTerm().getGrades().iterator().next();

                gradeName=grade.getName();

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
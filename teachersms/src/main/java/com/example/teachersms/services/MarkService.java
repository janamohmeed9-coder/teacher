package com.example.teachersms.services;

import com.example.teachersms.dtos.AddMarkRequest;
import com.example.teachersms.dtos.MarkResponse;
import com.example.teachersms.entities.*;
import com.example.teachersms.repositories.*;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.lang.Double;
import java.lang.Long;


@Service
@RequiredArgsConstructor
public class MarkService {

    private final MarkRepository markRepository;
    private final StudentRepository studentRepository;
    private final MarkTypeRepository markTypeRepository;
    private final CourseRepository courseRepository;
    private final AssignmentRepository assignmentRepository;
    @PersistenceContext
    private EntityManager entityManager;

    public List<MarkResponse> getAllMarks() {

        return markRepository.findAll()
                .stream()
                .map(mark -> MarkResponse.builder()
                        .markId(mark.getId())
                        .studentName(mark.getUser().getFirstName() + " " + mark.getUser().getLastName())
                        .assignmentName(
                                mark.getAssignment() != null
                                        ? mark.getAssignment().getName()
                                        : "Month Grade"
                        )
                        .markType(mark.getType().getType())
                        .score(mark.getScore())
                        .maxScore(mark.getMaxScore())
                        .approved(mark.getIsApproved())
                        .build())
                .toList();
    }
    public List<MarkResponse> getMarksByAssignment(Long assignmentId) {

        return markRepository
                .findByAssignment_Id(assignmentId)
                .stream()
                .map(mark -> MarkResponse.builder()
                        .markId(mark.getId())
                        .studentName(
                                mark.getUser().getFirstName() + " " +
                                        mark.getUser().getLastName())
                        .markType(mark.getType().getType())
                        .score(mark.getScore())
                        .maxScore(mark.getMaxScore())
                        .assignmentName(mark.getAssignment().getName())
                        .approved(mark.getIsApproved())
                        .build())
                .toList();

    }

    public void addMark(AddMarkRequest request) {

        System.out.println("studentId = " + request.getStudentId());
        System.out.println("courseId = " + request.getCourseId());
        System.out.println("assignmentId = " + request.getAssignmentId());
        System.out.println("typeId = " + request.getTypeId());

        Course course = courseRepository.findById(request.getCourseId())
                .orElseThrow(() -> new RuntimeException("Course not found"));

        Student student = studentRepository.findById(request.getStudentId())
                .orElseThrow(() -> new RuntimeException("Student not found"));

        MarksType type = markTypeRepository.findById(request.getTypeId())
                .orElseThrow(() -> new RuntimeException("Mark Type not found"));

        Assignment assignment = null;

        if (request.getAssignmentId() != null) {
            assignment = assignmentRepository.findById(request.getAssignmentId())
                    .orElseThrow(() -> new RuntimeException("Assignment not found"));
        }

        Mark mark = new Mark();

        mark.setCourse(course);
        mark.setUser(student.getUser());
        mark.setType(type);
        mark.setAssignment(assignment);

        mark.setScore(Double.valueOf(request.getScore()));
        mark.setMaxScore(Double.valueOf(request.getMaxScore()));
        mark.setFeedbackDate(LocalDate.now());
        mark.setIsApproved(false);

        markRepository.save(mark);
    }

    public void editMark(Long markId, AddMarkRequest request) {

        Mark mark = markRepository.findById(markId)
                .orElseThrow(() -> new RuntimeException("Mark not found"));

        if (Boolean.TRUE.equals(mark.getIsApproved())) {
            throw new RuntimeException("Published marks can't be edited");
        }

        mark.setScore(Double.valueOf(request.getScore()));
        mark.setMaxScore(Double.valueOf(request.getMaxScore()));

        markRepository.save(mark);

        if (Boolean.TRUE.equals(mark.getIsApproved())) {
            throw new RuntimeException("Published marks can't be edited");
        }
    }



    public void deleteMark(Long markId) {

        Mark mark = markRepository.findById(markId)
                .orElseThrow(() -> new RuntimeException("Mark not found"));

        if (Boolean.TRUE.equals(mark.getIsApproved())) {
            throw new RuntimeException("Published marks can't be deleted");
        }

        markRepository.delete(mark);

        if (Boolean.TRUE.equals(mark.getIsApproved())) {
            throw new RuntimeException("Published marks can't be deleted");
        }
    }


    public void publishAssignment(Long assignmentId) {

        assignmentRepository.findById(assignmentId)
                .orElseThrow(() -> new RuntimeException("Assignment not found"));

        markRepository.publishAssignment(assignmentId);
    }
}
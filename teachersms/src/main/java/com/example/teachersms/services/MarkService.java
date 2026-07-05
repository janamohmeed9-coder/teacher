package com.example.teachersms.services;

import com.example.teachersms.dtos.AddMarkRequest;
import com.example.teachersms.dtos.MarkResponse;
import com.example.teachersms.entities.Course;
import com.example.teachersms.entities.Mark;
import com.example.teachersms.entities.MarksType;
import com.example.teachersms.entities.Student;
import com.example.teachersms.repositories.CourseRepository;
import com.example.teachersms.repositories.MarkRepository;
import com.example.teachersms.repositories.MarkTypeRepository;
import com.example.teachersms.repositories.StudentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
@Service
@RequiredArgsConstructor
public class MarkService {

    private final MarkRepository markRepository;
    private final StudentRepository studentRepository;
    private final MarkTypeRepository markTypeRepository;
    private final CourseRepository courseRepository;
    @PersistenceContext
    private EntityManager entityManager;


    public List<MarkResponse> getAllMarks() {

        return markRepository.findAll()
                .stream()
                .map(mark -> MarkResponse.builder()
                        .studentName(
                                mark.getUser().getFirstName()
                                        + " "
                                        + mark.getUser().getLastName()
                        )
                        .markType(mark.getType().getType())
                        .score(mark.getScore())
                        .maxScore(mark.getMaxScore())
                        .build())
                .toList();
    }

    public void addMark(AddMarkRequest request){
        System.out.println("Request course id = " + request.getCourseId());

        System.out.println(courseRepository.findAll());

        System.out.println(courseRepository.existsById(request.getCourseId()));
        Course course = courseRepository.findById(request.getCourseId())
                .orElseThrow(() -> new RuntimeException("Course not found"));

        Student student = studentRepository.findById(request.getStudentId())
                .orElseThrow(() -> new RuntimeException("Student not found"));

        MarksType type = markTypeRepository.findById(request.getTypeId())
                .orElseThrow(() -> new RuntimeException("Type not found"));

        Mark mark = new Mark();

        mark.setUser(student.getUser());
        mark.setType(type);
        mark.setCourse(course);
        mark.setScore(request.getScore());
        mark.setMaxScore(request.getMaxScore());
        mark.setFeedbackDate(LocalDate.now());
        mark.setCourse(course);
        markRepository.save(mark);
    }

}
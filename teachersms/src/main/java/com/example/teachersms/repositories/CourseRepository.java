package com.example.teachersms.repositories;

import com.example.teachersms.entities.Course;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface CourseRepository extends JpaRepository<Course,Long> {

    List<Course> findByTerm_Grades_Id(Long gradeId);
    Optional<Course> findById(Long id);
}

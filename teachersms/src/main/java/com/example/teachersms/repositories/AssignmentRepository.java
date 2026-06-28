package com.example.teachersms.repositories;

import com.example.teachersms.entities.Assignment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AssignmentRepository extends JpaRepository<Assignment,Long> {
    List<Assignment> findByNameContainingIgnoreCase(String name);
    List<Assignment> findByCourses_Term_Grades_Id(Long gradeId);
}

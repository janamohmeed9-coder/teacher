package com.example.teachersms.repositories;

import com.example.teachersms.entities.Student;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface StudentRepository extends JpaRepository<Student,Long> {
    List<Student> findByStudentClass_Id(Long classId);
}

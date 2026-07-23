package com.example.teachersms.repositories;

import com.example.teachersms.entities.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface StudentRepository extends JpaRepository<Student,Long> {
    @Query("""
    SELECT DISTINCT s
    FROM Student s
    JOIN s.studentClass c
    JOIN Session ss ON ss.classField.id = c.id
    JOIN ss.course co
    WHERE co.teacher.id = :teacherId
""")
    List<Student> findStudentsByTeacher(Long teacherId);    List<Student> findByStudentClass_Id(Long classId);
}

package com.example.teachersms.repositories;

import com.example.teachersms.entities.Teacher;
import com.example.teachersms.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface TeacherRepository extends JpaRepository<Teacher,Long> {
    Optional<Teacher> findByUser(User user);
}

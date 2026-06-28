package com.example.teachersms.repositories;
import com.example.teachersms.entities.Class;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ClassRepository extends JpaRepository<Class,Long> {
}

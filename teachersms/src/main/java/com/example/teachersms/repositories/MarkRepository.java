package com.example.teachersms.repositories;

import com.example.teachersms.entities.Mark;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MarkRepository extends JpaRepository<Mark,Long> {
}

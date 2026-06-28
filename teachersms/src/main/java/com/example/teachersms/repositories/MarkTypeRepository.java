package com.example.teachersms.repositories;

import com.example.teachersms.entities.MarksType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MarkTypeRepository extends JpaRepository<MarksType,Long> {
}

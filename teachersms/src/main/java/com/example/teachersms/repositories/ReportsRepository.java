package com.example.teachersms.repositories;

import com.example.teachersms.entities.Report;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReportsRepository extends JpaRepository<Report,Long> {
}

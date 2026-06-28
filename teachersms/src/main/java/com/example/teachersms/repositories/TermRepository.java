package com.example.teachersms.repositories;

import com.example.teachersms.entities.Term;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TermRepository extends JpaRepository<Term,Long> {
}

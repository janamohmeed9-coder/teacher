package com.example.teachersms.repositories;

import com.example.teachersms.entities.Mark;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

public interface MarkRepository extends JpaRepository<Mark, Long> {

    List<Mark> findByAssignmentId(Long assignmentId);
    Optional<Mark> findByUser_IdAndType_Id(Long userId, Long typeId);

    List<Mark> findByAssignmentIdAndIsApprovedTrue(Long assignmentId);

    @Modifying(clearAutomatically = true, flushAutomatically = true)
    @Transactional
    @Query("""
            update Mark m
            set m.isApproved=true
            where m.assignment.id=:assignmentId
            """)
    void publishAssignment(@Param("assignmentId")Long assignmentId);
}
package com.example.teachersms.repositories;

import com.example.teachersms.entities.Session;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SessionRepository extends JpaRepository<Session, Long> {

    List<Session> findByCourseTeacherIdOrderByDayOfWeekAscStartAtAsc(Long teacherId);

}
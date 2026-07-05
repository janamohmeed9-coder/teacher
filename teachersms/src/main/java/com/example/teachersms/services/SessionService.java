package com.example.teachersms.services;

import com.example.teachersms.dtos.TeacherTimetableResponse;
import com.example.teachersms.entities.Session;
import com.example.teachersms.entities.Teacher;
import com.example.teachersms.entities.User;
import com.example.teachersms.repositories.SessionRepository;
import com.example.teachersms.repositories.TeacherRepository;
import com.example.teachersms.security.CustomUserDetails;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class SessionService {

    private final SessionRepository sessionRepository;
    private final TeacherRepository teacherRepository;

    public List<TeacherTimetableResponse> getTeacherTimetable() {

        CustomUserDetails userDetails =
                (CustomUserDetails) SecurityContextHolder.getContext()
                        .getAuthentication()
                        .getPrincipal();

        User user = userDetails.getUser();

        Teacher teacher = teacherRepository.findByUser(user)
                .orElseThrow(() -> new RuntimeException("Teacher not found"));

        List<Session> sessions =
                sessionRepository.findByCourseTeacherIdOrderByDayOfWeekAscStartAtAsc(teacher.getId());

        return sessions.stream()
                .map(session -> TeacherTimetableResponse.builder()
                        .sessionId(session.getId())
                        .courseName(session.getCourse().getCourseName())
                        .className(session.getClassField().getName())
                        .dayOfWeek(session.getDayOfWeek())
                        .startAt(session.getStartAt())
                        .endAt(session.getEndAt())
                        .build())
                .toList();
    }
}
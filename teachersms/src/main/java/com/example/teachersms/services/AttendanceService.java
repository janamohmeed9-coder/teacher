package com.example.teachersms.services;

import com.example.teachersms.dtos.AttendanceItemRequest;
import com.example.teachersms.dtos.AttendanceRequest;
import com.example.teachersms.entities.Attendance;
import com.example.teachersms.entities.Session;
import com.example.teachersms.entities.Student;
import com.example.teachersms.repositories.AttendanceRepository;
import com.example.teachersms.repositories.SessionRepository;
import com.example.teachersms.repositories.StudentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AttendanceService {

    private final AttendanceRepository attendanceRepository;
    private final StudentRepository studentRepository;
    private final SessionRepository sessionRepository;

    public void saveAttendance(AttendanceRequest request) {

        Session session = sessionRepository.findById(request.getSessionId())
                .orElseThrow(() -> new RuntimeException("Session not found"));

        for (AttendanceItemRequest item : request.getAttendance()) {

            System.out.println("StudentId = " + item.getStudentId());
            System.out.println("Exists = " + studentRepository.existsById(item.getStudentId()));

            Student student = studentRepository.findById(item.getStudentId())
                    .orElseThrow(() -> new RuntimeException("Student not found"));

            Attendance attendance = new Attendance();

            attendance.setStudent(student);
            attendance.setSession(session);
            attendance.setStatus(item.getStatus());

            attendanceRepository.save(attendance);
        }
    }
}
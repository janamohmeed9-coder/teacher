package com.example.teachersms.services;

import com.example.teachersms.dtos.DashboardResponse;
import com.example.teachersms.repositories.AssignmentRepository;
import com.example.teachersms.repositories.AttendanceRepository;
import com.example.teachersms.repositories.StudentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class DashboardService {

    private final StudentRepository studentRepository;
    private final AssignmentRepository assignmentRepository;
    private final AttendanceRepository attendanceRepository;

    public DashboardResponse getDashboard() {

        long studentsCount = studentRepository.count();

        long assignmentsCount = assignmentRepository.count();

        long totalAttendance = attendanceRepository.count();

        long presentAttendance = attendanceRepository.countByStatus('P');

        double attendancePercentage = 0.0;

        if (totalAttendance != 0) {
            attendancePercentage = (presentAttendance * 100.0) / totalAttendance;
        }

        return DashboardResponse.builder()
                .studentsCount(studentsCount)
                .assignmentsCount(assignmentsCount)
                .attendancePercentage(attendancePercentage)
                .build();
    }
}
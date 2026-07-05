package com.example.teachersms.controllers;

import com.example.teachersms.dtos.AttendanceRequest;
import com.example.teachersms.services.AttendanceService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/attendance")
@RequiredArgsConstructor
public class AttendanceController {

    private final AttendanceService attendanceService;

    @PostMapping
    public void saveAttendance(@RequestBody AttendanceRequest request) {
        attendanceService.saveAttendance(request);
    }
}
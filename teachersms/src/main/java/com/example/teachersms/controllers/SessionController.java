package com.example.teachersms.controllers;

import com.example.teachersms.dtos.TeacherTimetableResponse;
import com.example.teachersms.services.SessionService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/sessions")
@RequiredArgsConstructor
public class SessionController {

    private final SessionService sessionService;

    @GetMapping("/my-timetable")
    public ResponseEntity<List<TeacherTimetableResponse>> getMyTimeTable() {
        return ResponseEntity.ok(sessionService.getTeacherTimetable());
    }
}
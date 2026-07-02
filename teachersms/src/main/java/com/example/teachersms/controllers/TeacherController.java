package com.example.teachersms.controllers;

import com.example.teachersms.dtos.TeacherProfileResponse;
import com.example.teachersms.dtos.UpdateProfileRequest;
import com.example.teachersms.services.TeacherServices;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/teacher")
@RequiredArgsConstructor
public class TeacherController {

    private final TeacherServices teacherServices;

    @GetMapping("/profile")
    public ResponseEntity<TeacherProfileResponse> getTeacherProfile() {

        return ResponseEntity.ok(
                teacherServices.getTeacherProfile()
        );
    }

    @PutMapping("/profile")
    public ResponseEntity<TeacherProfileResponse> updateProfile(
            @RequestBody UpdateProfileRequest request) {

        return ResponseEntity.ok(
                teacherServices.updateProfile(request)
        );
    }
}
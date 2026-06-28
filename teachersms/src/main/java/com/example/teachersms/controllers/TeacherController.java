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

    @GetMapping("/profile/{id}")
    public ResponseEntity<TeacherProfileResponse> getTeacherProfile(
            @PathVariable Long id){

        return ResponseEntity.ok(
                teacherServices.getTeacherProfile(id)
        );
    }


    @PutMapping("/profile/{id}")
    public ResponseEntity<TeacherProfileResponse> updateProfile(
            @PathVariable Long id,
            @RequestBody UpdateProfileRequest request) {

        return ResponseEntity.ok(teacherServices.updateProfile(id, request));
    }

}
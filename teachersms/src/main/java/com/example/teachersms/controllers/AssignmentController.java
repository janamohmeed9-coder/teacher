package com.example.teachersms.controllers;

import com.example.teachersms.dtos.AssignmentResponse;
import com.example.teachersms.services.AssignmentService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/assignments")
@RequiredArgsConstructor
public class AssignmentController {

    private final AssignmentService assignmentService;

    @GetMapping
    public List<AssignmentResponse> getAssignments() {
        return assignmentService.getAssignments();
    }

    @GetMapping("/search")
    public List<AssignmentResponse> search(@RequestParam String name) {
        return assignmentService.searchAssignments(name);
    }

    @GetMapping("/filter")
    public List<AssignmentResponse> filter(@RequestParam Long gradeId) {
        return assignmentService.filterAssignments(gradeId);
    }
}
package com.example.teachersms.controllers;

import com.example.teachersms.dtos.AssignmentRequest;
import com.example.teachersms.dtos.AssignmentResponse;
import com.example.teachersms.services.AssignmentService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

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

    @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public AssignmentResponse createAssignment(
            @ModelAttribute AssignmentRequest request) {

        return assignmentService.createAssignment(request);
    }
    @GetMapping("/{id}")
    public AssignmentResponse getAssignmentById(@PathVariable Long id) {
        return assignmentService.getAssignmentById(id);
    }

    @PutMapping(value = "/{id}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public AssignmentResponse updateAssignment(
            @PathVariable Long id,
            @ModelAttribute AssignmentRequest request) {

        return assignmentService.updateAssignment(id, request);
    }
    @DeleteMapping("/{id}")
    public void deleteAssignment(@PathVariable Long id) {
        assignmentService.deleteAssignment(id);
    }
}
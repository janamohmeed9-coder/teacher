package com.example.teachersms.controllers;

import com.example.teachersms.dtos.AddMarkRequest;
import com.example.teachersms.dtos.MarkResponse;
import com.example.teachersms.services.MarkService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/marks")
@RequiredArgsConstructor
public class MarkController {

    private final MarkService markService;

    @GetMapping
    public List<MarkResponse> getMarks() {
        return markService.getAllMarks();
    }

    @PostMapping
    public void addMark(@RequestBody AddMarkRequest request) {
        markService.addMark(request);
    }

    @PutMapping("/{markId}")
    public void editMark(
            @PathVariable Long markId,
            @RequestBody AddMarkRequest request) {

        markService.editMark(markId, request);
    }

    @DeleteMapping("/{markId}")
    public void deleteMark(@PathVariable Long markId) {

        markService.deleteMark(markId);
    }

    @PutMapping("/publish-assignment/{assignmentId}")
    public void publishAssignment(@PathVariable Long assignmentId) {

        markService.publishAssignment(assignmentId);
    }

}
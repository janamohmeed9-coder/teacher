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
}
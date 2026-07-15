package com.example.teachersms.controllers;

import com.example.teachersms.dtos.MarkTypeResponse;
import com.example.teachersms.services.MarkTypeService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/mark-types")
@RequiredArgsConstructor
public class MarkTypeController {

    private final MarkTypeService markTypeService;

    @GetMapping
    public List<MarkTypeResponse> getAllMarkTypes() {
        return markTypeService.getAllMarkTypes();
    }
}
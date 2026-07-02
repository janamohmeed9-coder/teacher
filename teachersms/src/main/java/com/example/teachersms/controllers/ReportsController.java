package com.example.teachersms.controllers;

import com.example.teachersms.dtos.ReportResponse;
import com.example.teachersms.services.ReportsService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/reports")
@RequiredArgsConstructor
public class ReportsController {

    private final ReportsService reportsService;

    @GetMapping("/{userId}")
    public List<ReportResponse> getReports(@PathVariable Long userId) {

        return reportsService.getReports(userId);
    }
}
package com.example.teachersms.services;

import com.example.teachersms.dtos.ReportResponse;
import com.example.teachersms.entities.Report;
import com.example.teachersms.repositories.ReportsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ReportsService {

    private final ReportsRepository reportsRepository;

    public List<ReportResponse> getReports(Long userId) {

        List<Report> reports = reportsRepository.findBySentTo_Id(userId);

        return reports.stream()
                .map(report -> ReportResponse.builder()
                        .reportId(report.getId())
                        .reportName(report.getContent())
                        .senderName(
                                report.getUser().getFirstName()
                                        + " "
                                        + report.getUser().getLastName()
                        )
                        .createdAt(report.getCreatedAt())
                        .fileLink(report.getFileLink())
                        .build())
                .toList();
    }
}
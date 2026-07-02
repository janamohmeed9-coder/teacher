package com.example.teachersms.dtos;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDate;

@Data
@Builder
public class ReportResponse {

    private Long reportId;

    private String reportName;

    private String senderName;

    private LocalDate createdAt;

    private String fileLink;
}
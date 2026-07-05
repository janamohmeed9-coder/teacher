package com.example.teachersms.dtos;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;

@Data
public class AssignmentRequest {

    private String assignmentName;
    private String description;
    private LocalDate deadline;
    private MultipartFile file;
    private Long courseId;
}
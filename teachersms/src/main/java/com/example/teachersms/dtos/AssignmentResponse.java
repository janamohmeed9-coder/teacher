package com.example.teachersms.dtos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AssignmentResponse {

    private long assignmentId;
    private String assignmentName;
    private LocalDate assignDate;
    private LocalDate deadline;
    private String gradeName;
}
package com.example.teachersms.dtos;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class MarkResponse {

    private String studentName;

    private String markType;

    private double score;

    private double maxScore;

    private Long markId;

    private String assignmentName;

    private Boolean approved;
}
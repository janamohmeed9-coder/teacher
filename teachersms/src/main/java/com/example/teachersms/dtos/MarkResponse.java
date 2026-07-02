package com.example.teachersms.dtos;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class MarkResponse {

    private String studentName;

    private String markType;

    private Long score;

    private Long maxScore;
}
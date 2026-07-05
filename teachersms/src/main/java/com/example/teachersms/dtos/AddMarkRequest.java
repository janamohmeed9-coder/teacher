package com.example.teachersms.dtos;

import lombok.Data;

@Data
public class AddMarkRequest {

    private Long studentId;

    private Long courseId;

    private Long typeId;

    private Long score;

    private Long maxScore;
}
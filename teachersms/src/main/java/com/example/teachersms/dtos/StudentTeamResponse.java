package com.example.teachersms.dtos;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class StudentTeamResponse {

    private Long studentId;

    private String studentName;

    private String className;
}
package com.example.teachersms.dtos;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDate;
import java.util.List;

@Data
@Builder
public class TeamResponse {

    private Long teamId;
    private String teamName;

    private String projectName;
    private String projectDescription;

    private LocalDate assignDate;
    private LocalDate deadline;

    private List<String> studentNames;
}
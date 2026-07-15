package com.example.teachersms.dtos;

import lombok.Data;

import java.time.LocalDate;
import java.util.List;

@Data
public class CreateTeamRequest {

    private String teamName;

    private Long projectName;

    private String projectDescription;

    private LocalDate assignDate;
    private LocalDate deadline;

    private Long courseId;
    private List<Long> studentIds;
}
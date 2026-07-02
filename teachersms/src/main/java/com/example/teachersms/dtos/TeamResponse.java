package com.example.teachersms.dtos;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDate;

@Data
@Builder
public class TeamResponse {

    private Long teamId;

    private String teamName;

    private LocalDate assignDate;

    private LocalDate deadline;
}
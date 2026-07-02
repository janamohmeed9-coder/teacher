package com.example.teachersms.dtos;

import lombok.Data;

import java.util.List;

@Data
public class CreateTeamRequest {

    private String teamName;

    private Long projectId;

    private List<Long> studentIds;
}
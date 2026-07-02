package com.example.teachersms.controllers;

import com.example.teachersms.dtos.CreateTeamRequest;
import com.example.teachersms.dtos.StudentTeamResponse;
import com.example.teachersms.dtos.TeamResponse;
import com.example.teachersms.services.TeamService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/teams")
@RequiredArgsConstructor
public class TeamController {

    private final TeamService teamService;

    @GetMapping("/students")
    public List<StudentTeamResponse> getStudents() {
        return teamService.getStudents();
    }

    @PostMapping
    public void createTeam(@RequestBody CreateTeamRequest request) {
        teamService.createTeam(request);
    }

    @GetMapping
    public List<TeamResponse> getTeams() {
        return teamService.getTeams();
    }
}
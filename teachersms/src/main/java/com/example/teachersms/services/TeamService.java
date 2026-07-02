package com.example.teachersms.services;

import com.example.teachersms.dtos.CreateTeamRequest;
import com.example.teachersms.dtos.StudentTeamResponse;
import com.example.teachersms.dtos.TeamResponse;
import com.example.teachersms.entities.Project;
import com.example.teachersms.entities.Student;
import com.example.teachersms.entities.Team;
import com.example.teachersms.repositories.ProjectRepository;
import com.example.teachersms.repositories.StudentRepository;
import com.example.teachersms.repositories.TeamRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TeamService {

    private final StudentRepository studentRepository;
    private final TeamRepository teamRepository;
    private final ProjectRepository projectRepository;

    public List<StudentTeamResponse> getStudents() {

        List<Student> students = studentRepository.findAll();

        return students.stream()
                .map(student -> StudentTeamResponse.builder()
                        .studentId(student.getId())
                        .studentName(
                                student.getUser().getFirstName()
                                        + " "
                                        + student.getUser().getLastName()
                        )
                        .className(student.getStudentClass().getName())
                        .build())
                .toList();
    }

    public void createTeam(CreateTeamRequest request) {

        Project project = projectRepository.findById(request.getProjectId())
                .orElseThrow(() -> new RuntimeException("Project not found"));

        Team team = new Team();
        team.setName(request.getTeamName());
        team.setProject(project);

        teamRepository.save(team);

        for (Long studentId : request.getStudentIds()) {

            Student student = studentRepository.findById(studentId)
                    .orElseThrow(() -> new RuntimeException("Student not found"));

            student.getTeams().add(team);

            studentRepository.save(student);
        }
    }

    public List<TeamResponse> getTeams() {

        List<Team> teams = teamRepository.findAll();

        return teams.stream()
                .map(team -> TeamResponse.builder()
                        .teamId(team.getId())
                        .teamName(team.getName())
                        .assignDate(team.getProject().getAssignDate())
                        .deadline(team.getProject().getDeadline())
                        .build())
                .toList();
    }

}
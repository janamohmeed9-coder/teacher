package com.example.teachersms.services;

import com.example.teachersms.dtos.CreateTeamRequest;
import com.example.teachersms.dtos.StudentTeamResponse;
import com.example.teachersms.dtos.TeamResponse;
import com.example.teachersms.entities.Course;
import com.example.teachersms.entities.Project;
import com.example.teachersms.entities.Student;
import com.example.teachersms.entities.Team;
import com.example.teachersms.repositories.CourseRepository;
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
    private final CourseRepository courseRepository;

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


        Project project = new Project();

        project.setName(request.getTeamName());
        project.setDescription(request.getProjectDescription());
        project.setAssignDate(request.getAssignDate());
        project.setDeadline(request.getDeadline());


        Course course = courseRepository.findById(request.getCourseId())
                .orElseThrow(() -> new RuntimeException("Course not found"));

        project.setCourse(course);

        project = projectRepository.save(project);

        Team team = new Team();

        team.setName(request.getTeamName());
        team.setProject(project);

        team = teamRepository.save(team);

        for (Long studentId : request.getStudentIds()) {

            Student student = studentRepository.findById(studentId)
                    .orElseThrow(() -> new RuntimeException("Student not found"));

            student.getTeams().add(team);

            studentRepository.save(student);
        }
    }
    public List<TeamResponse> getTeams() {

        return teamRepository.findAll()
                .stream()
                .map(team -> TeamResponse.builder()
                        .teamId(team.getId())
                        .teamName(team.getName())
                        .projectName(team.getProject().getName())
                        .projectDescription(team.getProject().getDescription())
                        .assignDate(team.getProject().getAssignDate())
                        .deadline(team.getProject().getDeadline())
                        .studentNames(
                                team.getStudents()
                                        .stream()
                                        .map(student ->
                                                student.getUser().getFirstName()
                                                        + " "
                                                        + student.getUser().getLastName())
                                        .toList()
                        )
                        .build())
                .toList();
    }
}
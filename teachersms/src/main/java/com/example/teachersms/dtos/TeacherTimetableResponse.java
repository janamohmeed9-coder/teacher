package com.example.teachersms.dtos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;


@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TeacherTimetableResponse {

    private Long sessionId;
    private String courseName;
    private String className;
    private Long dayOfWeek;
    private LocalDate startAt;
    private LocalDate endAt;

}
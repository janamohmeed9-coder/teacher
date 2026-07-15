package com.example.teachersms.dtos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalTime;


@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TeacherTimetableResponse {

    private Long sessionId;
    private String courseName;
    private String className;
    private Long dayOfWeek;
    private LocalTime startAt;
    private LocalTime endAt;

}
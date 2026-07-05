package com.example.teachersms.dtos;

import lombok.Data;

@Data
public class AttendanceItemRequest {
    private Long studentId;
    private Character status;
}
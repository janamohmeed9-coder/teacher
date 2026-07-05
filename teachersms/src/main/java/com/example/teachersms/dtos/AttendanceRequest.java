package com.example.teachersms.dtos;

import com.example.teachersms.dtos.AttendanceItemRequest;
import lombok.Data;

import java.util.List;

@Data
public class AttendanceRequest {
    private Long sessionId;
    private List<AttendanceItemRequest> attendance;
}
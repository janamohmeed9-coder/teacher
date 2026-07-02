package com.example.teachersms.dtos;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDate;

@Data
@Builder
public class NotificationResponse {

    private Long notificationId;

    private String title;

    private String body;

    private String priority;

    private LocalDate sentAt;

    private String senderName;
}
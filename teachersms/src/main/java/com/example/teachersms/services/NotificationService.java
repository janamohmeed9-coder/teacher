package com.example.teachersms.services;

import com.example.teachersms.dtos.NotificationResponse;
import com.example.teachersms.entities.Notification;
import com.example.teachersms.entities.UserNotification;
import com.example.teachersms.repositories.UserNotificationRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class NotificationService {

    private final UserNotificationRepository userNotificationRepository;

    public List<NotificationResponse> getNotifications(Long userId) {

        List<UserNotification> notifications =
                userNotificationRepository.findBySentTo_Id(userId);

        return notifications.stream()
                .map(item -> {

                    Notification notification = item.getNotification();

                    return NotificationResponse.builder()
                            .notificationId(notification.getId())
                            .title(notification.getTitle())
                            .body(notification.getBody())
                            .priority(notification.getPriority())
                            .sentAt(notification.getSentAt())
                            .senderName(
                                    item.getUser().getFirstName()
                                            + " "
                                            + item.getUser().getLastName()
                            )
                            .build();
                })
                .toList();
    }
}
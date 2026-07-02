package com.example.teachersms.repositories;

import com.example.teachersms.entities.UserNotification;
import com.example.teachersms.entities.UserNotificationId;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserNotificationRepository
        extends JpaRepository<UserNotification, UserNotificationId> {

    List<UserNotification> findBySentTo_Id(Long userId);

}
package com.example.teachersms.services;

import com.example.teachersms.dtos.ClassResponse;
import com.example.teachersms.repositories.ClassRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor

public class ClassService {
    private final ClassRepository classRepository;
    public List<ClassResponse> getClasses() {

        return classRepository.findAll()
                .stream()
                .map(c -> ClassResponse.builder()
                        .classId(c.getId())
                        .className(c.getName())
                        .build())
                .toList();

    }
}

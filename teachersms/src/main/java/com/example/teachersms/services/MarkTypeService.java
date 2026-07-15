package com.example.teachersms.services;

import com.example.teachersms.dtos.MarkTypeResponse;
import com.example.teachersms.repositories.MarkTypeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MarkTypeService {

    private final MarkTypeRepository markTypeRepository;

    public List<MarkTypeResponse> getAllMarkTypes() {

        return markTypeRepository.findAll()
                .stream()
                .map(type -> MarkTypeResponse.builder()
                        .id(type.getId())
                        .type(type.getType())
                        .build())
                .toList();
    }
}
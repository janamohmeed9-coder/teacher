package com.example.teachersms.services;

import com.example.teachersms.dtos.MarkResponse;
import com.example.teachersms.entities.Mark;
import com.example.teachersms.repositories.MarkRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MarkService {

    private final MarkRepository markRepository;

    public List<MarkResponse> getAllMarks() {

        List<Mark> marks = markRepository.findAll();

        return marks.stream()
                .map(mark -> MarkResponse.builder()
                        .studentName(
                                mark.getUser().getFirstName()
                                        + " "
                                        + mark.getUser().getLastName()
                        )
                        .markType(mark.getType().getType())
                        .score(mark.getScore())
                        .maxScore(mark.getMaxScore())
                        .build())
                .toList();
    }
}
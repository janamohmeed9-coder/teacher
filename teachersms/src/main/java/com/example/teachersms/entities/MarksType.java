package com.example.teachersms.entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "MARKS_TYPE")
public class MarksType {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "mark_type_seq")
    @SequenceGenerator(
            name = "mark_type_seq",
            sequenceName = "MARK_TYPE_SEQ",
            allocationSize = 1
    )
    @Column(name = "TYPE_ID", nullable = false)
    private Long id;

    @Size(max = 50)
    @NotNull
    @Column(name = "\"TYPE\"", nullable = false, length = 50)
    private String type;


}
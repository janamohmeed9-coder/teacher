//package com.example.teachersms.entities;
//
//import jakarta.persistence.*;
//import jakarta.validation.constraints.NotNull;
//import jakarta.validation.constraints.Size;
//import lombok.Getter;
//import lombok.Setter;
//import jakarta.persistence.ManyToOne;
//import jakarta.persistence.JoinColumn;
//import org.hibernate.annotations.OnDelete;
//import org.hibernate.annotations.OnDeleteAction;
//
//import java.time.LocalDate;
//
//@Getter
//@Setter
//@Entity
//@Table(name = "MARKS")
//public class Mark {
//    @Id

//    @Column(name = "MARK_ID", nullable = false)
//    private Long id;
//
//    @NotNull
//    @ManyToOne(fetch = FetchType.LAZY, optional = false)
////    @OnDelete(action = OnDeleteAction.RESTRICT)
//    @JoinColumn(name = "COURSE_ID", nullable = false)
//    private Course course;
//
//    @NotNull
//    @ManyToOne(fetch = FetchType.LAZY, optional = false)
//    @JoinColumn(name = "USER_ID", nullable = false)
//    private User user;
//
//    @NotNull
//    @ManyToOne(fetch = FetchType.LAZY, optional = false)
//    @JoinColumn(name = "TYPE_ID", nullable = false)
//    private MarksType type;
//
//    @NotNull
//    @Column(name = "FEEDBACK_DATE", nullable = false)
//    private LocalDate feedbackDate;
//
//    @Size(max = 255)
//    @Column(name = "FEEDBACK")
//    private String feedback;
//
//    @Size(max = 255)
//    @Column(name = "NOTES")
//    private String notes;
//
//    @Column(name = "IS_APPROVED",nullable = false)
//    private boolean isApproved = false;
//
//    @NotNull
//    @Column(name = "SCORE")
//    private Long score;
//
//    @NotNull
//    @Column(name = "MAX_SCORE")
//    private Long maxScore;
//
//}



package com.example.teachersms.entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "MARKS")
public class Mark {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "mark_seq")
    @SequenceGenerator(
            name = "mark_seq",
            sequenceName = "MARK_SEQ",
            allocationSize = 1
    )
    @Column(name = "MARK_ID", nullable = false)
    private Long id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "COURSE_ID", nullable = false)
    private Course course;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "USER_ID", nullable = false)
    private User user;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "TYPE_ID", nullable = false)
    private MarksType type;

    @NotNull
    @Column(name = "FEEDBACK_DATE", nullable = false)
    private LocalDate feedbackDate;

    @Column(name = "SCORE")
    private Double score;

    @Column(name = "MAX_SCORE")
    private Double maxScore;

    @Column(name = "MONTH_NUMBER")
    private Integer monthNumber;

    @Column(name = "CALCULATED_SCORE")
    private Double calculatedScore;

    @Column(name = "CALCULATED_MAX_SCORE")
    private Double calculatedMaxScore;

    @Size(max = 255)
    @Column(name = "FEEDBACK")
    private String feedback;

    @Size(max = 255)
    @Column(name = "NOTES")
    private String notes;

    @Column(name = "IS_APPROVED")
    private Boolean isApproved;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ASSIGNMENT_ID", nullable = false)
    private Assignment assignment;

}
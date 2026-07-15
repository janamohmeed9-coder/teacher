import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { RouterModule, Router, ActivatedRoute } from '@angular/router';

import { GradeService } from '../../services/grade.service';
import { StudentService } from '../../services/student.service';
import { ClassService } from '../../services/class.service';

import { AddGradeInterface } from '../../interface/add-grade.interface';
import { StudentInterface } from '../../interface/student.interface';
import { ClassInterface } from '../../interface/class.interface';

@Component({
  selector: 'app-add-grade',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    RouterModule
  ],
  templateUrl: './add-grade.html',
  styleUrl: './add-grade.css'
})
export class AddGrade implements OnInit {

  constructor(
    private gradeService: GradeService,
    private studentService: StudentService,
    private classService: ClassService,
    private route: ActivatedRoute,
    private router: Router
  ) {}

  assignmentId: number | null = null;

  selectedClass: ClassInterface | null = null;

  grade: AddGradeInterface = {
    maxGrade: 0,
    studentGrade: 0
  };

  students: StudentInterface[] = [];
  filteredStudents: StudentInterface[] = [];
  selectedStudent: StudentInterface | null = null;

  classes: ClassInterface[] = [];

  ngOnInit(): void {

    const id = this.route.snapshot.paramMap.get('id');

    if (id) {
      this.assignmentId = Number(id);
    }

    this.classService.getClasses().subscribe({
      next: (data) => {
        this.classes = data;
      },
      error: (err) => {
        console.error(err);
      }
    });

  }

  loadStudents(): void {

    if (!this.selectedClass) {
      this.filteredStudents = [];
      this.selectedStudent = null;
      return;
    }

    this.studentService
      .getStudentsByClass(this.selectedClass.classId)
      .subscribe({
        next: (data) => {
          this.filteredStudents = data;
          this.selectedStudent = null;
        },
        error: (err) => {
          console.error(err);
        }
      });

  }

  saveGrade(): void {

    if (!this.selectedStudent) {
      alert('Please select a student');
      return;
    }

    const request = {

      studentId: this.selectedStudent.studentId,

      courseId: 1,

      assignmentId: this.assignmentId!,

      typeId: 1,

      score: this.grade.studentGrade,

      maxScore: this.grade.maxGrade

    };

    console.log(request);

    this.gradeService.addGrade(request).subscribe({

      next: () => {

        alert('Grade added successfully');

        if (this.assignmentId) {
          this.router.navigate(['/gradeAssign', this.assignmentId]);
        } else {
          this.router.navigate(['/grade']);
        }

      },

      error: (err) => {

        console.error(err);

        alert('Failed to add grade');

      }

    });

  }

}
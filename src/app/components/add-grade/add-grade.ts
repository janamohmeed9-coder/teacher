import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { RouterModule, Router } from '@angular/router';

import { GradeService } from '../../services/grade.service';
import { StudentService } from '../../services/student.service';

import { AddGradeInterface } from '../../interface/add-grade.interface';
import { StudentInterface } from '../../interface/student.interface';

import { ClassInterface } from '../../interface/class.interface';
import { ClassService } from '../../services/class.service';
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
  private router: Router
) {}

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

 this.classService.getClasses().subscribe({
    next: (data) => {
      this.classes = data;
      console.log(data); // لازم يطبع [{classId:..., className:'3A'}, ...]
    },
    error: (err) => {
      console.error(err);
    }
  });

}

loadStudents(): void {

  console.log("loadStudents called");
  console.log("selectedClass =", this.selectedClass);

  console.log("Selected Class:", this.selectedClass);
  console.log("Class Id:", this.selectedClass?.classId);

  if (!this.selectedClass) {
    this.filteredStudents = [];
    this.selectedStudent = null;
    return;
  }

  this.studentService
    .getStudentsByClass(this.selectedClass.classId)
    .subscribe({
      next: (data) => {
        console.log("Students:", data);
        this.filteredStudents = data;
        this.selectedStudent = null;
      },
      error: (err) => {
        console.log(err);
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

      assignmentId: 1,

      typeId: 1,

      score: this.grade.studentGrade,

      maxScore: this.grade.maxGrade

    };

    this.gradeService.addGrade(request).subscribe({

      next: () => {

        alert('Grade added successfully');

        this.router.navigate(['/grade']);

      },

      error: (err) => {

        console.error(err);

        alert('Failed to add grade');

      }

    });

  }

}
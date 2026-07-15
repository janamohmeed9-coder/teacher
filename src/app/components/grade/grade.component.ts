import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';

import { SearchBarComponent } from '../search-bar/search-bar.component';
import { EmptyStateComponent } from '../empty-state/empty-state.component';

import { GradeInterface } from '../../interface/grade.interface';
import { GradeService } from '../../services/grade.service';

@Component({
  selector: 'app-grade',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    SearchBarComponent,
    EmptyStateComponent,
    RouterModule
  ],
  templateUrl: './grade.component.html',
  styleUrl: './grade.component.scss'
})
export class GradeComponent implements OnInit {

  grades: GradeInterface[] = [];

  searchTerm = '';

  constructor(private gradeService: GradeService) {}

  ngOnInit(): void {
    this.loadGrades();
  }

  loadGrades() {
    this.gradeService.getGrades().subscribe({
      next: (data) => {
        console.log(data);
        this.grades = data;
      },
      error: (err) => {
        console.log(err);
      }
    });
  }

  onSearch(value: string) {
    this.searchTerm = value;
  }

  get filteredStudents() {
    return this.grades.filter(student =>
      this.searchTerm === '' ||
      student.studentName.toLowerCase().includes(this.searchTerm.toLowerCase())
    );
  }

  deleteGrade(id: number) {
    this.gradeService.deleteGrade(id).subscribe({
      next: () => {
        this.loadGrades();
      },
      error: (err) => {
        console.log(err);
      }
    });
  }

}
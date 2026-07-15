import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';

import { SearchBarComponent } from '../search-bar/search-bar.component';
import { EmptyStateComponent } from '../empty-state/empty-state.component';

import { GradeService } from '../../services/grade.service';
import { GradeInterface } from '../../interface/grade.interface';

@Component({
  selector: 'app-grade-assignment',
  standalone: true,
  imports: [
    CommonModule,
    RouterModule,
    SearchBarComponent,
    EmptyStateComponent
  ],
  templateUrl: './grade-assignment.component.html',
  styleUrl: './grade-assignment.component.scss'
})
export class GradeAssignmentComponent implements OnInit {

  constructor(private gradeService: GradeService) {}

  searchTerm = '';

  grades: GradeInterface[] = [];

  ngOnInit(): void {
    this.grades = this.gradeService.getGrades();
  }

  onSearch(value: string) {
    this.searchTerm = value;
  }

  get filteredStudents() {
    return this.grades.filter(item =>
item.studentName
        .toLowerCase()
        .includes(this.searchTerm.toLowerCase())
    );
  }

  deleteGrade(id: number) {
    this.gradeService.deleteGrade(id);
    this.grades = this.gradeService.getGrades();
  }

}
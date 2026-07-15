import { Component } from '@angular/core';
import { RouterModule } from '@angular/router';
import { SearchBarComponent } from '../search-bar/search-bar.component';
import { CommonModule } from '@angular/common';
import { EmptyStateComponent } from '../empty-state/empty-state.component';
import { FilterComponent } from '../filter/filter.component';
import { StudentInterface } from '../../interface/student.interface';
import { StudentService } from '../../services/student.service';
import { OnInit } from '@angular/core';
@Component({
  selector: 'app-list',
  standalone:true,
  imports: [RouterModule, SearchBarComponent, CommonModule, EmptyStateComponent, FilterComponent],
  templateUrl: './list.html',
  styleUrl: './list.css',
})
export class List implements OnInit{
constructor(private studentService: StudentService) {}
ngOnInit(): void {
  this.loadStudents();
}
loadStudents() {
  this.studentService.getAllStudents().subscribe({
    next: (data) => {
      console.log("Students:", data);
      this.students = data;
    },
    error: (err) => {
      console.log("Error:", err);
    }
  });
}
students: StudentInterface[] = [
  {
  studentId: 11,
  firstname: 'raghad',
  lastName: 'mostafa',
  birthDate: '20 march',
  email: 'raghdm85@gmail',
  phoneNumber: 201063241677,
  className: '2A',
  gradeName: 'grade 11',
  },
  {
  studentId: 11,
  firstname: 'raghad',
  lastName: 'mostafa',
  birthDate: '20 march',
  email: 'raghdm85@gmail',
  phoneNumber: 201063241677,
  className: '2A',
  gradeName: 'grade 11',
  }
];
grades = [
  'Grade 10',
  'Grade 11',
  'Grade 12'
];
selectedGrade = '';

onGradeChange(value: string) {
  this.selectedGrade = value;
}
searchTerm: string = '';

onSearch(value: string) {
  this.searchTerm = value;
}

get filteredStudents() {
  return this.students.filter(student => {

    const matchSearch =
      this.searchTerm === '' ||
      student.firstname.toLowerCase().includes(this.searchTerm.toLowerCase());

    const matchGrade =
      this.selectedGrade === '' ||
      student.gradeName === this.selectedGrade;

    return matchSearch && matchGrade;
  });
}
}

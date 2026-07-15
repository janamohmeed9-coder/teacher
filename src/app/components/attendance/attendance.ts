import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { StudentResponse } from '../../interface/student-response.interface';
import { SidebarComponent } from '../sidebar/sidebar.component';
import { SearchBarComponent } from '../search-bar/search-bar.component';
import { FilterComponent } from '../filter/filter.component';
import { EmptyStateComponent } from '../empty-state/empty-state.component';

import { AttendanceInterface } from '../../interface/attendance.interface';
import { AttendanceService } from '../../services/attendance.service';

@Component({
  selector: 'app-attendance',
  standalone: true,
  imports: [
    SidebarComponent,
    CommonModule,
    FormsModule,
    SearchBarComponent,
    FilterComponent,
    EmptyStateComponent
  ],
  templateUrl: './attendance.html',
  styleUrl: './attendance.css'
})
export class Attendance implements OnInit {

  students: AttendanceInterface[] = [];

  selectAll = false;
  searchTerm = '';

  classes = [
    'Class 2A',
    'Class 2B'
  ];

  sessions = [
    'Session 1',
    'Session 2',
    'Session 3',
    'Session 4',
    'Session 5',
    'Session 6',
    'Session 7',
    'Session 8'
  ];

  selectedClass = '';
  selectedSession = '';

  constructor(private attendanceService: AttendanceService) {}

  ngOnInit(): void {
    this.loadAttendance();
  }

loadAttendance(): void {

  this.attendanceService.getAttendance(1).subscribe({

    next: (data: StudentResponse[]) => {

      this.students = data.map((student: StudentResponse) => ({

        id: student.studentId.toString(),

        name: student.firstname + ' ' + student.lastName,

        grade: student.gradeName,

        className: student.className,

        session: 'Session 1',

        status: '',

        selected: false

      }));

    },

    error: (err: any) => {

      console.error(err);

    }

  });

}

  onSearch(value: string) {
    this.searchTerm = value;
  }

  onClassChange(value: string) {
    this.selectedClass = value;
  }

  onSessionChange(value: string) {
    this.selectedSession = value;
  }

  get filteredStudents() {
    return this.students.filter(student => {

      const matchSearch =
        this.searchTerm === '' ||
        student.name.toLowerCase().includes(this.searchTerm.toLowerCase());

      const matchClass =
        this.selectedClass === '' ||
        student.className === this.selectedClass;

      const matchSession =
        this.selectedSession === '' ||
        student.session === this.selectedSession;

      return matchSearch && matchClass && matchSession;
    });
  }

  toggleAll() {
    this.filteredStudents.forEach(student => {
      student.selected = this.selectAll;
    });
  }

  setStatus(student: AttendanceInterface, status: string) {
    student.status = status;
  }
}
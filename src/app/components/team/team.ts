import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router, RouterModule } from '@angular/router';

import { SearchBarComponent } from '../search-bar/search-bar.component';
import { FilterComponent } from '../filter/filter.component';
import { EmptyStateComponent } from '../empty-state/empty-state.component';

import { TeamService } from '../../services/team.service';
import { StudentTeamInterface } from '../../interface/student-team.interface';
interface Student {

  studentId: number;

  studentName: string;

  className: string;

  selected: boolean;

}

@Component({
  selector: 'app-team',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    RouterModule,
    SearchBarComponent,
    FilterComponent,
    EmptyStateComponent
  ],
  templateUrl: './team.html',
  styleUrl: './team.css'
})
export class Team implements OnInit {




  constructor(
    private teamService: TeamService,
    private router: Router
  ) {}

  students: Student[] = [];

  searchTerm = '';

  selectedClass = '';

  classes: string[] = [];

  ngOnInit(): void {

    this.teamService.getStudents().subscribe({

      next: (data: StudentTeamInterface[]) => {

        this.students = data.map(student => ({

          studentId: student.studentId,

          studentName: student.studentName,

          className: student.className,

          selected: false

        }));

        this.classes = [...new Set(data.map(s => s.className))];

      },

      error: err => console.error(err)

    });

  }

  onSearch(value: string) {

    this.searchTerm = value;

  }

  onClassChange(value: string) {

    this.selectedClass = value;

  }

  get filteredStudents() {

    return this.students.filter(student => {

      const searchMatch =

        this.searchTerm === '' ||

        student.studentName
          .toLowerCase()
          .includes(this.searchTerm.toLowerCase());

      const classMatch =

        this.selectedClass === '' ||

        student.className === this.selectedClass;

      return searchMatch && classMatch;

    });

  }

  addTeam() {

    const selectedIds = this.students
      .filter(student => student.selected)
      .map(student => student.studentId);

    this.router.navigate(
      ['/addTeams'],
      {
        state: {
          studentIds: selectedIds
        }
      }
    );

  }

}
import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';

import { TimetableService } from '../../services/timetable.service';
import { TeacherTimetable } from '../../interface/teacher-timetable.interface';

@Component({
  selector: 'app-table',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './timeTable.html',
  styleUrl: './timeTable.scss'
})
export class Table implements OnInit {

  timetable: TeacherTimetable[] = [];

  table: { [day: number]: { [time: string]: TeacherTimetable } } = {};

  constructor(private timetableService: TimetableService) {}

  ngOnInit(): void {

    this.timetableService.getTimetable().subscribe({

      next: (data) => {

        this.timetable = data;

        this.buildTable();

        console.log(this.table);

      },

      error: (err) => {

        console.log(err);

      }

    });

  }

  buildTable(): void {

    this.table = {
      1: {},
      2: {},
      3: {},
      4: {},
      5: {}
    };

    this.timetable.forEach(session => {

      this.table[session.dayOfWeek][session.startAt] = session;

    });

  }

  getSession(day: number, time: string): TeacherTimetable | null {

    return this.table[day]?.[time] || null;

  }

}
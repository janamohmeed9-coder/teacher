import { Component, OnInit } from '@angular/core';
import { FilterComponent } from '../filter/filter.component';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { Course } from '../../models/course';
import { CourseService } from '../../services/course';

@Component({
  selector: 'app-courses',
  standalone: true,
  imports: [FilterComponent, CommonModule, RouterModule],
  templateUrl: './courses.html',
  styleUrls: ['./courses.css']
})
export class Courses implements OnInit {

  courses: Course[] = [];

  grades = [
    'Grade 10',
    'Grade 11',
    'Grade 12'
  ];

  searchTerm = '';
  selectedGrade = '';

  constructor(private courseService: CourseService) {}

  ngOnInit(): void {
    this.loadCourses();
  }

  loadCourses() {
    this.courseService.getCourses().subscribe({
      next: (data) => {
        console.log(data);
        this.courses = data;
      },
      error: (err) => {
        console.error(err);
      }
    });
  }

  onSearch(value: string) {
    this.searchTerm = value;
  }

  onGradeChange(value: string) {
    this.selectedGrade = value;
  }

  get filteredCourses() {
    return this.courses.filter(course => {

      const matchSearch =
        this.searchTerm === '' ||
        course.courseName
          .toLowerCase()
          .includes(this.searchTerm.toLowerCase());

      return matchSearch;
    });
  }
}
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Course } from '../models/course';

@Injectable({
  providedIn: 'root'
})
export class CourseService {

  private apiUrl = 'http://localhost:8080/courses';

  constructor(private http: HttpClient) {}

  getCourses(): Observable<Course[]> {

    return this.http.get<Course[]>(this.apiUrl);

  }

  getCoursesByGrade(gradeId: number): Observable<Course[]> {

    return this.http.get<Course[]>(
      `${this.apiUrl}?gradeId=${gradeId}`
    );

  }

}
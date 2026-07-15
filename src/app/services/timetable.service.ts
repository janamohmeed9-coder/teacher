import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { TeacherTimetable } from '../interface/teacher-timetable.interface';

@Injectable({
  providedIn: 'root'
})
export class TimetableService {

  private api = 'http://localhost:8080/sessions/timetable';

  constructor(private http: HttpClient) {}

  getTimetable(): Observable<TeacherTimetable[]> {
    return this.http.get<TeacherTimetable[]>(this.api);
  }

}
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { StudentResponse } from '../interface/student-response.interface';
@Injectable({
  providedIn: 'root'
})
export class AttendanceService {

  private apiUrl = 'http://localhost:8080/attendance';

  constructor(private http: HttpClient) {}

  getStudents(sessionId: number): Observable<StudentResponse[]> {
    return this.http.get<StudentResponse[]>(
      `${this.apiUrl}/session/${sessionId}/students`
    );
  }
   getAttendance(sessionId: number): Observable<StudentResponse[]> {
    return this.http.get<StudentResponse[]>(
      `http://localhost:8080/attendance/session/${sessionId}/students`
    );
  }
}
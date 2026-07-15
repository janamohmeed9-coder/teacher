import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { AttendanceInterface } from '../interface/attendance.interface';

@Injectable({
  providedIn: 'root'
})
export class AttendanceService {

  private apiUrl = 'http://localhost:8080/atteance';

  constructor(private http: HttpClient) {}

  getAttendance(): Observable<AttendanceInterface[]> {
    return this.http.get<AttendanceInterface[]>(this.apiUrl);
  }
}
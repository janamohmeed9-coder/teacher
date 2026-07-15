import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { StudentInterface } from '../interface/student.interface';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class StudentService {

  private url = 'http://localhost:8080/student'; 

  constructor(private http: HttpClient) {}

  getAllStudents(): Observable<StudentInterface[]> {
    return this.http.get<StudentInterface[]>(this.url);
  }

getStudentsByClass(classId: number): Observable<StudentInterface[]> {
  return this.http.get<StudentInterface[]>(
    `http://localhost:8080/student/class/${classId}`
  );
}
}
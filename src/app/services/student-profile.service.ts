import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { StudentProfilei } from '../interface/student-profilei.interface';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class StudentProfileService {

  constructor(private http: HttpClient) {}

getStudentProfile(id: number): Observable<StudentProfilei> {
  return this.http.get<StudentProfilei>(
    `http://localhost:8080/student/${id}`
  );
}
}
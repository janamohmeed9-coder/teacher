import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Injectable } from '@angular/core';

import { GradeInterface } from '../interface/grade.interface';
import { AddMarkRequest } from '../interface/add-mark-request.interface';
@Injectable({
  providedIn: 'root'
})
export class GradeService {

  private apiUrl = "http://localhost:8080/marks";

  constructor(private http: HttpClient) {}

  getGrades(): Observable<GradeInterface[]> {
    return this.http.get<GradeInterface[]>(this.apiUrl);
  }

  addGrade(request: AddMarkRequest): Observable<void> {
    return this.http.post<void>(this.apiUrl, request);
  }

  deleteGrade(id: number) {
    return this.http.delete(`${this.apiUrl}/${id}`);
  }
 getMarksByAssignment(assignmentId: number): Observable<GradeInterface[]> {
  return this.http.get<GradeInterface[]>(
    `${this.apiUrl}/assignment/${assignmentId}`
  );
}

}
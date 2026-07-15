import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

import { AssignmentInterface } from '../interface/assignment.interface';
import { AssignmentRequest } from '../interface/assignment-request.interface';

@Injectable({
  providedIn: 'root'
})
export class AssignmentService {

  private apiUrl = 'http://localhost:8080/assignments';

  constructor(private http: HttpClient) {}

  getAllAssignments(): Observable<AssignmentInterface[]> {

    return this.http.get<AssignmentInterface[]>(this.apiUrl);

  }

  getAssignment(id: number): Observable<AssignmentInterface> {

    return this.http.get<AssignmentInterface>(`${this.apiUrl}/${id}`);

  }

  addAssignment(data: AssignmentRequest) {

    const formData = new FormData();

    formData.append('assignmentName', data.assignmentName);
    formData.append('description', data.description);
    formData.append('deadline', data.deadline);
    formData.append('courseId', data.courseId.toString());

    if (data.file) {
      formData.append('file', data.file);
    }

    return this.http.post<AssignmentInterface>(this.apiUrl, formData);

  }

  deleteAssignment(id: number) {

    return this.http.delete(`${this.apiUrl}/${id}`);

  }

}
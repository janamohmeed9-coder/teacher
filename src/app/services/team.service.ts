import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { TeamInterface } from '../interface/team.interface';
import { CreateTeamRequest } from '../interface/create-team-request.interface';
import { StudentTeamInterface } from '../interface/student-team.interface';
@Injectable({
  providedIn: 'root'
})
export class TeamService {

  private apiUrl = 'http://localhost:8080/teams';

  constructor(private http: HttpClient) {}

  getStudents(): Observable<StudentTeamInterface[]> {
    return this.http.get<StudentTeamInterface[]>(`${this.apiUrl}/students`);
  }

  getTeams(): Observable<TeamInterface[]> {
    return this.http.get<TeamInterface[]>(this.apiUrl);
  }

  createTeam(request: CreateTeamRequest): Observable<void> {
    return this.http.post<void>(this.apiUrl, request);
  }

}
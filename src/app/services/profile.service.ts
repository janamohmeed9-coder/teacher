import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Profile } from '../interface/profile.interface';

@Injectable({
  providedIn: 'root'
})
export class ProfileService {

  private apiUrl = "http://localhost:8080/teacher/profile";

  constructor(private http: HttpClient) {}

  getProfile(): Observable<Profile> {
    return this.http.get<Profile>(this.apiUrl);
  }
}
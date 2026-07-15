import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Dashboard } from '../interface/dashboard.interface';
@Injectable({
  providedIn: 'root'
})
export class DashboardService {

  constructor(private http: HttpClient) {}
  getDashboard(){
    return this.http.get<Dashboard>("http://localhost:8080/dashboard");
  }
}

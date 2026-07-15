import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { ReportInterface } from '../interface/report.interface';

@Injectable({
  providedIn: 'root'
})
export class ReportService {

  private apiUrl = 'http://localhost:8080/reports';

  constructor(private http: HttpClient) {}

  getReports(): Observable<ReportInterface[]> {
    return this.http.get<ReportInterface[]>(this.apiUrl);
  }
}
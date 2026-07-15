import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { NotificationResponse } from '../interface/notificationResponse.interface';
@Injectable({
  providedIn: 'root'
})
export class NotificationService {

  private api = 'http://localhost:8080/notifications';

  constructor(private http: HttpClient) {}

  getNotifications(userId: number): Observable<NotificationResponse[]> {
    return this.http.get<NotificationResponse[]>(`${this.api}/${userId}`);
  }
}
import { Injectable } from "@angular/core";
import { HttpClient } from "@angular/common/http";
import { ClassInterface } from "../interface/class.interface";
import { Observable } from "rxjs";
@Injectable({
  providedIn: 'root'
})
export class ClassService {

  private apiUrl = 'http://localhost:8080/classes';

  constructor(private http: HttpClient) {}

  getClasses(): Observable<ClassInterface[]> {
    return this.http.get<ClassInterface[]>(this.apiUrl);
  }

}
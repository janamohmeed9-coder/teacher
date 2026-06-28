import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DashboardService } from '../../services/dashboard.service';
import { Dashboard } from '../../interface/dashboard.interface';
import { OnInit } from '@angular/core';

@Component({
  selector: 'app-dashboard',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './dashboard.component.html',
  styleUrl: './dashboard.component.scss'
})
export class DashboardComponent implements OnInit{
  dashboard!: Dashboard;
  constructor(private dashboardService:DashboardService){}
  ngOnInit(): void {
  
  }
  dayNames = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  calendarDays: (number | null)[] = [
    null, null, 1, 2, 3, 4, 5,
    6, 7, 8, 9, 10, 11, 12,
    13, 14, 15, 16, 17, 18, 19,
    20, 21, 22, 23, 24, 25, 26,
    27, 28, 29, 30, null, null, null
  ];

  performance = [
    { day: 'Sat', value: 60, color: '#4a9eff' },
    { day: 'Mon', value: 80, color: '#4a9eff' },
    { day: 'Tue', value: 45, color: '#4a9eff' },
    { day: 'Wed', value: 70, color: '#4a9eff' },
    { day: 'Thu', value: 55, color: '#4a9eff' },
  ];
}

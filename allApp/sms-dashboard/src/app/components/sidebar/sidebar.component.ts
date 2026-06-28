import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { RouterModule } from '@angular/router';
import { routes } from '../../app.routes';
@Component({
  selector: 'app-sidebar',
  standalone: true,
  imports: [CommonModule, RouterLink, RouterModule],
  templateUrl: './sidebar.component.html',
  styleUrl: './sidebar.component.scss'
})
export class SidebarComponent {
  activeItem = 'assignment';

  navItems = [
    { key: 'attendance', label: 'Attendance', icon: '' },
    { key: 'student-list', label: 'Student List',route:'/student-profile', icon: '' },
    { key: 'teams', label: 'Teams', icon: '' },
    { key: 'project', label: 'Project', icon: '' },
    { key: 'course', label: 'Course', icon: '' },
    { key: 'profile', label: 'Profile', route:'/profile', icon: '' },
    { key: 'reports', label: 'Reports', icon: '' },
    { key: 'assignment', label: 'Assignment', icon: '' },
    { key: 'grades', label: 'Grades', icon: '' },
    { key: 'notifications', label: 'Notifications', icon: '' },
  ];

  setActive(key: string) {
    this.activeItem = key;
  }
}

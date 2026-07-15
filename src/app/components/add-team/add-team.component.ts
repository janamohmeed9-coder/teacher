import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';

import { CourseService } from '../../services/course';
import { TeamService } from '../../services/team.service';
import { CreateTeamRequest } from '../../interface/create-team-request.interface';

@Component({
  selector: 'app-add-team',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './add-team.component.html',
  styleUrl: './add-team.component.scss'
})
export class AddTeamComponent implements OnInit {

  courses: any[] = [];

  request: CreateTeamRequest = {
    teamName: '',
    projectDescription: '',
    assignDate: '',
    deadline: '',
    courseId: 0,
    studentIds: []
  };

  constructor(
    private teamService: TeamService,
    private courseService: CourseService,
    private router: Router
  ) {

    const navigation = this.router.getCurrentNavigation();

    if (navigation?.extras.state) {
      this.request.studentIds = navigation.extras.state['studentIds'];
    }
  }

  ngOnInit(): void {
    this.courseService.getCourses().subscribe({
      next: (data) => {
        this.courses = data;
      },
      error: (err) => {
        console.log(err);
      }
    });
  }

publish() {
  console.log(JSON.stringify(this.request));

  this.teamService.createTeam(this.request).subscribe({
    next: () => {
      this.router.navigate(['/allTeams']);
    },
    error: (err) => {
      console.log(err);
    }
  });
}
}
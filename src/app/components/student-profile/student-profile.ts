import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { StudentProfilei } from '../../interface/student-profilei.interface';
import { StudentProfileService } from '../../services/student-profile.service';

@Component({
  selector: 'app-student-profile',
  standalone: true,
  imports: [],
  templateUrl: './student-profile.html',
  styleUrl: './student-profile.css',
})
export class StudentProfile implements OnInit {

  profile!: StudentProfilei;

  constructor(
    private studentService: StudentProfileService,
    private route: ActivatedRoute
  ) {}

  ngOnInit(): void {

    const id = Number(this.route.snapshot.paramMap.get('id'));

    this.studentService.getStudentProfile(id).subscribe({
      next: (data) => {
        console.log(data);
        this.profile = data;
      },
      error: (err) => {
        console.error(err);
      }
    });
  }
}
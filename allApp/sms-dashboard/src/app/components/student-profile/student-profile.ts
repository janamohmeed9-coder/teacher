import { Component } from '@angular/core';
import { OnInit } from '@angular/core';
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

  constructor(private studentService: StudentProfileService) {}

  ngOnInit(): void {
    this.studentService.getStudentProfile().subscribe(data => {
      this.profile = data;
    });
  }

}
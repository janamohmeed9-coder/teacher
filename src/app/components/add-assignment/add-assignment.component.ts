import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { AssignmentService } from '../../services/assignment.service';
import { AssignmentRequest } from '../../interface/assignment-request.interface';
import { CourseService } from '../../services/course';
import { Course } from '../../models/course';
@Component({
  selector: 'app-add-assignment',
  standalone: true,
  imports: [FormsModule, CommonModule],
  templateUrl: './add-assignment.component.html',
  styleUrl: './add-assignment.component.scss'
})
export class AddAssignmentComponent implements OnInit{

  constructor(
    private assignmentService: AssignmentService,
    private courseService: CourseService,
    private router: Router
  ) {}
  courses: Course[]=[];

  assignment: AssignmentRequest = {
    assignmentName: '',
    description: '',
    deadline: '',
    courseId: 0,
    file: null
  };

  selectedFile: File | null = null;
 ngOnInit(): void {
    this.courseService.getCourses().subscribe({
      next: (data) => {
        this.courses = data;
        console.log(data);
      },
      error: (err) => console.error(err)
    });
  }

  onFileSelected(event: any) {

    if (event.target.files.length > 0) {
      this.selectedFile = event.target.files[0];
      this.assignment.file = this.selectedFile;
    }

  }

  createAssignment() {

    this.assignmentService.addAssignment(this.assignment).subscribe({

      next: () => {

        this.router.navigate(['/assignment']);

      },

      error: (err) => {

        console.error(err);

      }

    });

  }

}
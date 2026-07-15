import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { SearchBarComponent } from '../search-bar/search-bar.component';
import { EmptyStateComponent } from '../empty-state/empty-state.component';
import { FilterComponent } from '../filter/filter.component';
import { AssignmentInterface } from '../../interface/assignment.interface';
import { AssignmentService } from '../../services/assignment.service';
import { OnInit } from '@angular/core';
import { AddAssignmentComponent } from '../add-assignment/add-assignment.component';
@Component({
  selector: 'app-assignment',
  standalone: true,
  imports: [CommonModule, RouterModule, SearchBarComponent, EmptyStateComponent, FilterComponent, AddAssignmentComponent],
  templateUrl: './assignment.html',
  styleUrl: './assignment.css',
})
export class Assignment implements OnInit{
  ngOnInit(): void {
    this.loadAssignments();
  }

  loadAssignments() {
  this.assignmentService.getAllAssignments().subscribe({
    next: (data) => {
      this.assignments = data;
    },
    error: (err) => {
      console.error(err);
    }
  });
}

constructor(private assignmentService: AssignmentService) {}
  searchTerm = '';

assignments: AssignmentInterface[] = [];

  onSearch(value: string) {
    this.searchTerm = value;
  }


get filteredAssignments() {

  return this.assignments.filter(item => {

    return this.searchTerm === '' ||
      item.assignmentName
        .toLowerCase()
        .includes(this.searchTerm.toLowerCase());

  });

}deleteAssignment(id: number) {

  this.assignmentService.deleteAssignment(id).subscribe({

    next: () => {

      this.loadAssignments();

    },

    error: (err) => {

      console.error(err);

    }

  });

}

}

import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { EmptyStateComponent } from '../empty-state/empty-state.component';
import { TeamService } from '../../services/team.service';
import { TeamInterface } from '../../interface/team.interface';

@Component({
  selector: 'app-all-teams',
  standalone: true,
  imports: [
    CommonModule,
    RouterModule,
    EmptyStateComponent
  ],
  templateUrl: './all-teams.component.html',
  styleUrl: './all-teams.component.scss'
})
export class AllTeamsComponent implements OnInit {

  teams: TeamInterface[] = [];

  constructor(private teamService: TeamService) {}

  ngOnInit(): void {

    this.teamService.getTeams().subscribe({

      next: (data) => {

        this.teams = data;

        console.log(data);

      },

      error: (err) => {

        console.error(err);

      }

    });

  }

}
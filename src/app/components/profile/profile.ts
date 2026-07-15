import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ProfileService } from '../../services/profile.service';
import { Profile } from '../../interface/profile.interface';

@Component({
  selector: 'app-profile',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './profile.html',
  styleUrl: './profile.css'
})
export class ProfileComponent implements OnInit {

  profile!: Profile;

  constructor(private profileService: ProfileService) {}

  ngOnInit(): void {
    this.profileService.getProfile().subscribe({
      next: (data) => {
        this.profile = data;
        console.log(data);
      },
      error: (err) => {
        console.error(err);
      }
    });
  }
}
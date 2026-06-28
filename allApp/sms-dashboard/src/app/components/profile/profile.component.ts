import { Component } from '@angular/core';
import { Profile } from '../../interface/profile.interface';

@Component({
  selector: 'app-profile',
  standalone: true,
  imports: [],
  templateUrl: './profile.component.html',
  styleUrl: './profile.component.scss',
})
export class ProfileComponent {
profile!: Profile;
}

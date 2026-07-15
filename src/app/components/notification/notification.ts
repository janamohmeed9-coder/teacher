import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NotificationService } from '../../services/notification.service';
import { EmptyStateComponent } from '../empty-state/empty-state.component';
import { NotificationResponse } from '../../interface/notificationResponse.interface';
import { SearchBarComponent } from '../search-bar/search-bar.component';
@Component({
  selector: 'app-notification',
  standalone: true,
  imports: [
    CommonModule,
    SearchBarComponent,
    EmptyStateComponent
  ],
  templateUrl: './notification.html',
  styleUrl: './notification.css'
})
export class NotificationComponent implements OnInit {

  notifications: NotificationResponse[] = [];

  searchTerm = '';

  constructor(
    private notificationService: NotificationService
  ) {}

  ngOnInit(): void {

    const userId = 1; 

    this.notificationService.getNotifications(userId).subscribe({

      next: (data) => {

        this.notifications = data;

      },

      error: (err) => {

        console.log(err);

      }

    });

  }

  onSearch(value: string) {

    this.searchTerm = value;

  }

  get filteredNotifications() {

    return this.notifications.filter(item =>

      this.searchTerm === '' ||

      item.title.toLowerCase().includes(this.searchTerm.toLowerCase()) ||

      item.body.toLowerCase().includes(this.searchTerm.toLowerCase()) ||

      item.senderName.toLowerCase().includes(this.searchTerm.toLowerCase())

    );

  }

}
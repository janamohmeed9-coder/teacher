import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SearchBarComponent } from '../search-bar/search-bar.component';
import { EmptyStateComponent } from '../empty-state/empty-state.component';
import { FilterComponent } from '../filter/filter.component';
import { OnInit } from '@angular/core';
import { ReportInterface } from '../../interface/report.interface';
import { ReportService } from '../../services/report.service';

@Component({
  selector: 'app-report',
  standalone: true,
  imports: [CommonModule, SearchBarComponent, EmptyStateComponent, FilterComponent],
  templateUrl: './report.html',
  styleUrl: './report.css',
})
export class Report implements OnInit{
constructor(private reportService: ReportService) {}
  searchTerm = '';

reports: ReportInterface[] = [];

receivers = [
  'School Admin',
  'NTG Admin'
];
ngOnInit(): void {
  this.loadReports();
}

loadReports() {
  this.reportService.getReports().subscribe({
    next: (data) => {
      console.log(data);
      this.reports = data;
    },
    error: (err) => {
      console.error(err);
    }
  });
}
selectedReceiver = '';

onReceiverChange(value: string) {
  this.selectedReceiver = value;
}
  onSearch(value: string) {
    this.searchTerm = value;
  }

get filteredReports() {
  return this.reports.filter(report => {

    const matchSearch =
      this.searchTerm === '' ||
      report.reportName.toLowerCase().includes(this.searchTerm.toLowerCase()) ||
      report.senderName.toLowerCase().includes(this.searchTerm.toLowerCase());

    const matchReceiver =
      this.selectedReceiver === '' ||
      report.senderName === this.selectedReceiver;

    return matchSearch && matchReceiver;
  });
}
}
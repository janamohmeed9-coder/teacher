import { Component, EventEmitter, Input, Output } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-filter',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './filter.component.html',
  styleUrl: './filter.component.scss'
})
export class FilterComponent {

  @Input() placeholder = 'Select';

  @Input() options: string[] = [];

  @Output() selected = new EventEmitter<string>();

  onChange(event: Event) {
    const value = (event.target as HTMLSelectElement).value;
    this.selected.emit(value);
  }

}
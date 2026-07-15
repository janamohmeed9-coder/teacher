import { Component, Input, input } from '@angular/core';

@Component({
  selector: 'app-empty-state',
  standalone: true,
  imports: [],
  templateUrl: './empty-state.component.html',
  styleUrl: './empty-state.component.scss'
})
export class EmptyStateComponent {
@Input() title = 'No Data Found';

@Input() description = 'Try another search.';

}

import { CanActivateFn, Router } from '@angular/router';
import { inject } from '@angular/core';

export const teacherGuard: CanActivateFn = () => {

  const router = inject(Router);

  const role = localStorage.getItem('role');

  if (role === 'TEACHER') {
    return true;
  }

  router.navigate(['/login']);
  return false;
};
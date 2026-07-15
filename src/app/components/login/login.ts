import { CommonModule } from '@angular/common';
import { Component, inject } from '@angular/core';
import {
    FormControl,
    FormGroup,
    Validators,
    ReactiveFormsModule,
} from '@angular/forms';
import { AuthService } from '../../services/auth-service';
import Swal from 'sweetalert2';
import { Router } from '@angular/router';

@Component({
    selector: 'app-login',
    standalone: true,
    imports: [ReactiveFormsModule, CommonModule],
    templateUrl: './login.html',
    styleUrls: ['./login.css'],
})
export class Login {
    private authService = inject(AuthService);
    private router = inject(Router);

    loginForm = new FormGroup({
        email: new FormControl('', [Validators.required, Validators.email]),
        password: new FormControl('', [
            Validators.required,
        ]),
    });

    submit() {
        console.log("submit called")
        if (true) {
            this.authService
                .authenticate({
                    email: this.loginForm.value.email!,
                    password: this.loginForm.value.password!,
                })
                .subscribe({
                    next: (value) => {
                        console.log(value);

                        this.authService.saveToken(value.token);
                        this.authService.saveRole(value.role);

                        Swal.fire({
                            title: 'Done!',
                            text: 'Your action has been completed successfully.',
                            icon: 'success',
                            confirmButtonText: 'OK',
                        });

                        this.router.navigate(['/timeTable']);
                    },

                    error: (err) => {
                        console.log(err);
                        
                        if (err.status == 401) {
                            Swal.fire({
                                title: 'Login Failed',
                                text: 'The username or password you entered is incorrect. Please double-check your spelling and try again.',
                                icon: 'error',
                                confirmButtonText: 'Try again',
                            });
                        }
                    },
                });
        } else {
            this.loginForm.markAllAsTouched();
        }
    }

    private navigateByRole(role: string) {
        switch (role) {
            case 'STUDENT_AFFAIRS':
                this.router.navigate(['/dashboard']);
                break;

            default:
                this.router.navigate(['/login']);
        }
    }
}
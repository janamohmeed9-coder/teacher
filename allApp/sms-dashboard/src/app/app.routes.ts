import { Routes } from "@angular/router";
import { DashboardComponent } from "./components/dashboard/dashboard.component";
import { ProfileComponent } from "./components/profile/profile.component";
import { StudentProfile } from "./components/student-profile/student-profile";
import { List } from "./components/studentList/list";
import { Assignment } from "./components/assignment/assignment";
export const routes: Routes = [
    {path: '', redirectTo: 'dashboard',
        pathMatch:'full'
    },
    {path: 'dashboard' , component:DashboardComponent},
    {path: 'profile' , component:ProfileComponent},
    {path: 'student-profile', component:StudentProfile},
    {path: 'assignment', component:Assignment},
    {path: 'studentList', component:List}



]
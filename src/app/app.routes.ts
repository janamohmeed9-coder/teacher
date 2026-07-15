import { Routes } from "@angular/router";
import { Table } from "./components/timeTable/timeTable";
import { ProfileComponent } from "./components/profile/profile";
import { List } from "./components/studentList/list";
import { Assignment } from "./components/assignment/assignment";
import { GradeComponent } from "./components/grade/grade.component";
import { Login } from "./components/login/login";
import { Courses } from "./components/courses/courses";
import { Report } from "./components/report/report";
import { Team } from "./components/team/team";
import { NotificationComponent } from "./components/notification/notification";
import { AddTeamComponent } from "./components/add-team/add-team.component";
import { AllTeamsComponent } from "./components/all-teams/all-teams.component";
import { AddAssignmentComponent } from "./components/add-assignment/add-assignment.component";
import { Attendance } from "./components/attendance/attendance";
import { StudentProfile } from "./components/student-profile/student-profile";
import { AddGrade } from "./components/add-grade/add-grade";
export const routes: Routes = [
    {path: '', redirectTo: 'login',pathMatch:'full'},
    {path: 'timeTable' , component:Table},
    {path: 'studentProfile/:id' , component:StudentProfile},
    {path: 'profile', component:ProfileComponent},
    {path: 'assignment', component:Assignment},
    {path: 'studentList', component:List},
    {path: 'grade', component:GradeComponent},
    {path: 'login', component:Login},
    {path: 'courses', component:Courses},
    {path: 'report', component:Report},
    {path: 'team', component:Team},
    {path: 'notification', component:NotificationComponent},
    {path: 'addTeams', component:AddTeamComponent},
    {path: 'allTeams', component:AllTeamsComponent},
    {path: 'add-assignment',component: AddAssignmentComponent},
    {path: 'attendance', component: Attendance},
    {path: 'addGrade', component: AddGrade},
]
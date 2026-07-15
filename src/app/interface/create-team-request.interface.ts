export interface CreateTeamRequest {
  teamName: string;
  projectName?: number;
  projectDescription: string;
  assignDate: string;
  deadline: string;
  courseId: number;
  studentIds: number[];
}
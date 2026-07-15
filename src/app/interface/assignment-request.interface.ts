export interface AssignmentRequest {

  assignmentName: string;

  description: string;

  deadline: string;

  courseId: number;

  file: File | null;

}
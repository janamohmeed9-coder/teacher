export interface Notification {
  id: number;
  title: string;
  description: string;
  priority: 'High' | 'Medium' | 'Low';
  category: 'Finance' | 'Academic' | 'Student';
  date: string;
  time: string;
  section: 'Today' | 'Yesterday' | 'This Week';
}

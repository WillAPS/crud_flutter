class Task {
  final int id;
  final String taskTitle;
  final String taskSubTitle;

  Task(this.id, this.taskTitle, this.taskSubTitle);

  @override
  String toString() {
    return 'Contact{id: $id, name: $taskTitle, accountNumber: $taskSubTitle}';
  }
}
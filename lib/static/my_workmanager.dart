enum MyWorkmanager {
  periodic("daily_notification", "notification");

  final String uniqueName;
  final String taskName;

  const MyWorkmanager(this.uniqueName, this.taskName);
}

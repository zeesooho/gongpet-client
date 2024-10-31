String formatDate(String dateStr) {
  final date = DateTime.parse(dateStr);
  final now = DateTime.now();
  final difference = now.difference(date);

  if (difference.inDays > 7) {
    return '${date.year}.${date.month}.${date.day}';
  } else if (difference.inDays > 0) {
    return '${difference.inDays}일 전';
  } else if (difference.inHours > 0) {
    return '${difference.inHours}시간 전';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes}분 전';
  } else {
    return '방금 전';
  }
}

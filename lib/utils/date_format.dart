String formatDateManual(DateTime date) {
  const monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  final day = date.day;
  final suffix = _getDaySuffix(day);
  return '${monthNames[date.month - 1]} $day$suffix';
}

String _getDaySuffix(int day) {
  if (day >= 11 && day <= 13) return 'th'; // special case
  switch (day % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}

String formatDateManual(DateTime date, {bool useShortForm = false}) {
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

  const monthNamesShort = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  final day = date.day;
  final suffix = _getDaySuffix(day);
  final monthList = useShortForm ? monthNamesShort : monthNames;
  return '${monthList[date.month - 1]} $day$suffix';
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

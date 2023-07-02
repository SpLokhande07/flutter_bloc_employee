/// get coming day date (1 for Monday and 7 for Sunday)
extension DateUtils on DateTime {
  DateTime next(int day) {
    return add(
      Duration(
        days: (day - weekday) % DateTime.daysPerWeek,
      ),
    );
  }
}

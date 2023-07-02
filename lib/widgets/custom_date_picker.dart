import 'package:employee_ri/controller/bloc/employee_bloc.dart';
import 'package:employee_ri/controller/bloc_exports.dart';
import 'package:employee_ri/utils/constants.dart';
import 'package:employee_ri/utils/extensions/date_time_extension.dart';
import 'package:employee_ri/utils/toast.dart';
import 'package:employee_ri/widgets/calender/calender_header.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomDatePicker extends StatefulWidget {
  final bool isEndDate;
  final TextEditingController controller;
  const CustomDatePicker(
      {super.key, required this.isEndDate, required this.controller});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? focusedDate;
  DateTime? selectedDate;
  int selectedOption = 0;
  List<String> monthList = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // focusedDate = DateTime.now();
    // selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeBloc, EmployeeState>(builder: (context, state) {
      var bloc = context.read<EmployeeBloc>();
      return TableCalendar(
        firstDay: widget.isEndDate
            ? dateformat.parse(state.employee.startDate!)
            : DateTime.now(),
        focusedDay: focusedDate != null
            ? focusedDate!
            : widget.isEndDate
                ? dateformat.parse(state.employee.startDate!)
                : DateTime.now(),
        lastDay: DateTime(DateTime.now().year, DateTime.now().month + 3),
        // currentDay: selectedDate,
        calendarFormat: CalendarFormat.month,

        onDaySelected: (selectedDay, focusedDay) {
          widget.isEndDate
              ? bloc.add(EndDateChanged(endDate: dateformat.format(focusedDay)))
              : bloc.add(
                  StartDateChanged(startDate: dateformat.format(focusedDay)));
          // if (!isSameDay(selectedDay, focusedDay)) {
          setState(() {
            focusedDate = focusedDay;
            selectedDate = selectedDay;
            // widget.controller.text = dateformat.format(selectedDay);
          });
          // }
        },
        selectedDayPredicate: (day) {
          return isSameDay(selectedDate, day);
        },
        calendarStyle: CalendarStyle(
          selectedDecoration:
              BoxDecoration(shape: BoxShape.circle, color: kButtonColor),
          todayDecoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(color: kIconColor)),
          todayTextStyle: TextStyle(color: kIconColor),
          isTodayHighlighted: true,
        ),
        calendarBuilders: CalendarBuilders(
          headerTitleBuilder: (_, date) {
            return headerBuilder(context, date);
          },
        ),
        headerStyle: const HeaderStyle(
            formatButtonShowsNext: true,
            titleCentered: true,
            formatButtonVisible: false,
            leftChevronVisible: false,
            rightChevronVisible: false,
            headerPadding: EdgeInsets.symmetric(vertical: 16),
            formatButtonPadding: EdgeInsets.zero),
      );
    });
  }

  Widget headerBuilder(context, date) {
    return BlocBuilder<EmployeeBloc, EmployeeState>(builder: (context, state) {
      var bloc = context.read<EmployeeBloc>();
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!widget.isEndDate)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      String today = dateformat.format(DateTime.now());
                      widget.isEndDate
                          ? bloc.add(EndDateChanged(endDate: today))
                          : bloc.add(StartDateChanged(startDate: today));
                      widget.controller.text = today;
                      Navigator.pop(context);
                    },
                    child: ShadowButton(
                        title: "Today", isSelected: (selectedOption == 1))),
                GestureDetector(
                  onTap: () {
                    String next = dateformat.format(DateTime.now().next(1));
                    widget.isEndDate
                        ? bloc.add(EndDateChanged(endDate: next))
                        : bloc.add(StartDateChanged(startDate: next));
                    widget.controller.text = next;
                    Navigator.pop(context);
                  },
                  child: ShadowButton(
                      title: "Next Monday", isSelected: (!widget.isEndDate)),
                ),
              ],
            ),
          if (!widget.isEndDate)
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.015,
            ),
          if (!widget.isEndDate)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    String next = dateformat.format(DateTime.now().next(2));
                    widget.isEndDate
                        ? bloc.add(EndDateChanged(endDate: next))
                        : bloc.add(StartDateChanged(startDate: next));

                    widget.controller.text = next;
                    Navigator.pop(context);
                  },
                  child: ShadowButton(
                      title: "Next Tuesday", isSelected: (selectedOption == 3)),
                ),
                GestureDetector(
                  onTap: () {
                    String nextWeek = dateformat
                        .format(DateTime.now().add(const Duration(days: 7)));
                    widget.isEndDate
                        ? bloc.add(EndDateChanged(endDate: nextWeek))
                        : bloc.add(StartDateChanged(startDate: nextWeek));
                    widget.controller.text = nextWeek;
                    Navigator.pop(context);
                  },
                  child: ShadowButton(
                      title: "After 1 week", isSelected: (selectedOption == 4)),
                ),
              ],
            ),
          if (widget.isEndDate)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    String next = "No date";
                    bloc.add(EndDateChanged(endDate: next));
                    widget.controller.text = next;
                    Navigator.pop(context);
                  },
                  child: ShadowButton(
                      title: "No date", isSelected: (widget.isEndDate)),
                ),
                GestureDetector(
                    onTap: () {
                      if (dateformat
                          .parse(bloc.state.employee.startDate!)
                          .isBefore(DateTime.now())) {
                        String today = dateformat.format(DateTime.now());
                        widget.isEndDate
                            ? bloc.add(EndDateChanged(endDate: today))
                            : bloc.add(StartDateChanged(startDate: today));
                        widget.controller.text = today;
                      } else {
                        showToast(msg: "The joining date is yet to come");
                      }
                      Navigator.pop(context);
                    },
                    child: ShadowButton(
                        title: "Today", isSelected: (selectedOption == 1))),
              ],
            ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.015,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('asset/calendar_arrow_left.png'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "${monthList[date.month - 1]} ${date.year}",
                  style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600,
                      color: kFontColor),
                ),
              ),
              Image.asset('asset/calendar_arrow_right.png'),
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.015,
          ),
        ],
      );
    });
  }

  Widget todayBuilder(
      BuildContext buildContext, DateTime today, DateTime focusedDay) {
    return Container(
        margin: const EdgeInsets.all(4.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10.0)),
        child: Text(
          today.day.toString(),
          style: const TextStyle(color: Colors.white),
        ));
  }

  bool isSameDay(DateTime? a, DateTime? b) {
    if (a == null || b == null) {
      return false;
    }
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}

import 'package:app_project/widgets/date_widget.dart';
import 'package:app_project/gestures/tap.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

class DatePicker extends StatefulWidget {
  final DateTime startDate;

  final double width;
  final double height;

  // DatePicker Controller
  final DatePickerController? controller;

  // color selection
  final Color selectedTextColor;
  final Color selectionColor;
  final Color deactivatedColor;
  final Color deactivatedTextColor;

  // TextStyle selection
  final TextStyle monthTextStyle;
  final TextStyle dayTextStyle;
  final TextStyle dateTextStyle;

  final List<DateTime>? inactiveDates;

  final List<DateTime>? activeDates;

  final DateChangeListener? onDateChange;

  final int daysCount;

  final String locale;

  DatePicker(
    this.startDate, {
    Key? key,
    this.width = 60,
    this.height = 80,
    this.controller,
    this.monthTextStyle = const TextStyle(fontSize: 13),
    this.dayTextStyle = const TextStyle(fontSize: 13),
    this.dateTextStyle = const TextStyle(fontSize: 16),
    this.selectedTextColor = const Color.fromARGB(255, 254, 251, 228),
    this.selectionColor = const Color.fromARGB(100, 1, 97, 4),
    this.deactivatedColor = const Color.fromARGB(255, 1, 97, 4),
    this.deactivatedTextColor = const Color.fromARGB(255, 1, 97, 4),
    this.activeDates,
    this.inactiveDates,
    this.daysCount = 500,
    this.onDateChange,
    this.locale = "en_US",
  }) : assert(
            activeDates == null || inactiveDates == null,
            "Can't "
            "provide both activated and deactivated dates List at the same time.");

  @override
  State<StatefulWidget> createState() => new _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? _currentDate;

  ScrollController _controller = ScrollController();

  late final TextStyle selectedDateStyle;
  late final TextStyle selectedMonthStyle;
  late final TextStyle selectedDayStyle;

  late final TextStyle deactivatedDateStyle;
  late final TextStyle deactivatedMonthStyle;
  late final TextStyle deactivatedDayStyle;

  @override
  void initState() {
    initializeDateFormatting(widget.locale, null);

    _currentDate = widget.startDate;

    if (widget.controller != null) {
      widget.controller!.setDatePickerState(this);
    }

    this.selectedDateStyle =
        widget.dateTextStyle.copyWith(color: widget.selectedTextColor);
    this.selectedMonthStyle =
        widget.monthTextStyle.copyWith(color: widget.selectedTextColor);
    this.selectedDayStyle =
        widget.dayTextStyle.copyWith(color: widget.selectedTextColor);

    this.deactivatedDateStyle =
        widget.dateTextStyle.copyWith(color: widget.deactivatedColor);
    this.deactivatedMonthStyle =
        widget.monthTextStyle.copyWith(color: widget.deactivatedColor);
    this.deactivatedDayStyle =
        widget.dayTextStyle.copyWith(color: widget.deactivatedColor);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: ListView.builder(
        itemCount: widget.daysCount,
        scrollDirection: Axis.horizontal,
        controller: _controller,
        itemBuilder: (context, index) {
          DateTime date;
          DateTime _date = widget.startDate.add(Duration(days: index));
          date = new DateTime(_date.year, _date.month, _date.day);

          bool isDeactivated = false;

          if (widget.inactiveDates != null) {
            for (DateTime inactiveDate in widget.inactiveDates!) {
              if (_compareDate(date, inactiveDate)) {
                isDeactivated = true;
                break;
              }
            }
          }

          if (widget.activeDates != null) {
            isDeactivated = true;
            for (DateTime activateDate in widget.activeDates!) {
              if (_compareDate(date, activateDate)) {
                isDeactivated = false;
                break;
              }
            }
          }

          bool isSelected =
              _currentDate != null ? _compareDate(date, _currentDate!) : false;

          return DateWidget(
            date: date,
            monthTextStyle: isDeactivated
                ? deactivatedMonthStyle
                : isSelected
                    ? selectedMonthStyle
                    : widget.monthTextStyle,
            dateTextStyle: isDeactivated
                ? deactivatedDateStyle
                : isSelected
                    ? selectedDateStyle
                    : widget.dateTextStyle,
            dayTextStyle: isDeactivated
                ? deactivatedDayStyle
                : isSelected
                    ? selectedDayStyle
                    : widget.dayTextStyle,
            width: widget.width,
            locale: widget.locale,
            selectionColor:
                isSelected ? widget.selectionColor : Colors.transparent,
            onDateSelected: (selectedDate) {
              if (isDeactivated) return;

              if (widget.onDateChange != null) {
                widget.onDateChange!(selectedDate);
              }
              setState(() {
                _currentDate = selectedDate;
              });
            },
          );
        },
      ),
    );
  }

  bool _compareDate(DateTime date1, DateTime date2) {
    return date1.day == date2.day &&
        date1.month == date2.month &&
        date1.year == date2.year;
  }
}

class DatePickerController {
  _DatePickerState? _datePickerState;

  void setDatePickerState(_DatePickerState state) {
    _datePickerState = state;
  }

  void jumpToSelection() {
    assert(_datePickerState != null,
        'DatePickerController is not attached to any DatePicker View.');

    // jump to the current Date
    _datePickerState!._controller
        .jumpTo(_calculateDateOffset(_datePickerState!._currentDate!));
  }

  /// This function will animate the Timeline to the currently selected Date
  void animateToSelection(
      {duration = const Duration(milliseconds: 500), curve = Curves.linear}) {
    assert(_datePickerState != null,
        'DatePickerController is not attached to any DatePicker View.');

    // animate to the current date
    _datePickerState!._controller.animateTo(
        _calculateDateOffset(_datePickerState!._currentDate!),
        duration: duration,
        curve: curve);
  }

  /// This function will animate to any date that is passed as an argument
  /// In case a date is out of range nothing will happen
  void animateToDate(DateTime date,
      {duration = const Duration(milliseconds: 500), curve = Curves.linear}) {
    assert(_datePickerState != null,
        'DatePickerController is not attached to any DatePicker View.');

    _datePickerState!._controller.animateTo(_calculateDateOffset(date),
        duration: duration, curve: curve);
  }

  /// This function will animate to any date that is passed as an argument
  /// this will also set that date as the current selected date
  void setDateAndAnimate(DateTime date,
      {duration = const Duration(milliseconds: 500), curve = Curves.linear}) {
    assert(_datePickerState != null,
        'DatePickerController is not attached to any DatePicker View.');

    _datePickerState!._controller.animateTo(_calculateDateOffset(date),
        duration: duration, curve: curve);

    if (date.compareTo(_datePickerState!.widget.startDate) >= 0 &&
        date.compareTo(_datePickerState!.widget.startDate
                .add(Duration(days: _datePickerState!.widget.daysCount))) <=
            0) {
      // date is in the range
      _datePickerState!._currentDate = date;
    }
  }

  /// Calculate the number of pixels that needs to be scrolled to go to the
  /// date provided in the argument
  double _calculateDateOffset(DateTime date) {
    final startDate = new DateTime(
        _datePickerState!.widget.startDate.year,
        _datePickerState!.widget.startDate.month,
        _datePickerState!.widget.startDate.day);

    int offset = date.difference(startDate).inDays;
    return (offset * _datePickerState!.widget.width) + (offset * 6);
  }
}

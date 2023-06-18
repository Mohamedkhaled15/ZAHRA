import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  final String label;
  final DateTime initialDateTime;
  final Function(DateTime) onDateTimeChanged;

  const Calendar({
    required this.label,
    required this.initialDateTime,
    required this.onDateTimeChanged,
  });

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late DateTime _dateTime;

  @override
  void initState() {
    super.initState();
    _dateTime = widget.initialDateTime;
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDateTime = await showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(2015),
      lastDate: DateTime(2101),
    );
    if (pickedDateTime != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_dateTime),
      );
      if (pickedTime != null) {
        final newDateTime = DateTime(
          pickedDateTime.year,
          pickedDateTime.month,
          pickedDateTime.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        setState(() {
          _dateTime = newDateTime;
        });
        widget.onDateTimeChanged(newDateTime);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectDateTime(context),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: widget.label,
          border: OutlineInputBorder(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${_dateTime.day}/${_dateTime.month}/${_dateTime.year} ${_dateTime.hour}:${_dateTime.minute}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Icon(Icons.calendar_today),
          ],
        ),
      ),
    );
  }
}
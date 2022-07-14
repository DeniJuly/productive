import 'package:flutter/material.dart';
import 'package:productive/config/theme.dart';

class InputDateTime extends StatefulWidget {
  String label;
  TimeOfDay? time;
  DateTime? date;
  final onChangeDate;
  final onChangeTime;
  InputDateTime(
      {Key? key,
      this.label = '',
      this.time,
      this.date,
      this.onChangeDate,
      this.onChangeTime})
      : super(key: key);

  @override
  State<InputDateTime> createState() => _InputDateTimeState();
}

class _InputDateTimeState extends State<InputDateTime> {
  @override
  Widget build(BuildContext context) {
    Future handleDatePicker() async {
      DateTime initialDate = DateTime.now();
      DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: widget.date ?? initialDate,
        firstDate: DateTime(DateTime.now().year),
        lastDate: DateTime(DateTime.now().year + 1),
      );
      if (newDate == null) return;
      widget.onChangeDate(newDate);
    }

    Future handleTimePicker() async {
      TimeOfDay initialTime = TimeOfDay.now();
      TimeOfDay? newTime = await showTimePicker(
        context: context,
        initialTime: widget.time ?? initialTime,
      );
      if (newTime == null) return;
      widget.onChangeTime(newTime);
    }

    String getDate() {
      if (widget.date == null) {
        return '00/00/00';
      } else {
        final tgl = widget.date?.day.toString().padLeft(2, '0');
        final bln = widget.date?.month.toString().padLeft(2, '0');
        final year = widget.date?.year.toString();
        return '${tgl} - ${bln} - ${year}';
      }
    }

    String getTime() {
      if (widget.time == null) {
        return '00:00';
      } else {
        final jam = widget.time?.hour.toString().padLeft(2, '0');
        final menit = widget.time?.minute.toString().padLeft(2, '0');
        return '${jam} : ${menit}';
      }
    }

    Widget datePicker() {
      return Expanded(
        child: GestureDetector(
          onTap: () => handleDatePicker(),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
              color: whiteColor,
            ),
            child: Text(
              getDate(),
              style: primaryTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ),
        ),
      );
    }

    Widget timePicker() {
      return GestureDetector(
        onTap: () => handleTimePicker(),
        child: Container(
          width: 120,
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 15,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            color: whiteColor,
          ),
          child: Text(
            getTime(),
            style: primaryTextStyle.copyWith(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: primaryTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            datePicker(),
            const SizedBox(
              width: 10,
            ),
            timePicker(),
          ],
        )
      ],
    );
  }
}

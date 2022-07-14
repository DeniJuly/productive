import 'package:flutter/material.dart';
import 'package:productive/config/theme.dart';

class ItemPlan extends StatelessWidget {
  bool checked;
  String? title;
  String? location;
  TimeOfDay? start;
  TimeOfDay? end;
  ItemPlan(
      {this.checked = false, this.title, this.location, this.start, this.end});

  @override
  Widget build(BuildContext context) {
    Widget Checked() {
      return Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              30,
            ),
          ),
        ),
        child: Icon(
          Icons.check_rounded,
          color: whiteColor,
          size: 24,
        ),
      );
    }

    Widget Unchecked() {
      return Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              30,
            ),
          ),
          border: Border.all(
            width: 2,
            color: greyColor,
          ),
        ),
      );
    }

    String getTime(time) {
      if (time == null) {
        return '00:00';
      } else {
        final jam = time?.hour.toString().padLeft(2, '0');
        final menit = time?.minute.toString().padLeft(2, '0');
        return '${jam}:${menit}';
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            20,
          ),
        ),
      ),
      child: Row(
        children: [
          checked ? Checked() : Unchecked(),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? '',
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                ),
              ),
              Text(
                "${location ?? '-'}, ${getTime(start)} - ${getTime(end)}",
                style: greyTextStyle.copyWith(
                  fontSize: 10,
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}

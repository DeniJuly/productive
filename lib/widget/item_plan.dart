// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:productive/config/theme.dart';

class ItemPlan extends StatelessWidget {
  bool? checkedPlan;
  String? title;
  String? location;
  String? start;
  String? end;
  final changechecked;
  final handleDelete;
  String? id;
  ItemPlan({
    Key? key,
    this.checkedPlan,
    this.title,
    this.location,
    this.start,
    this.end,
    this.changechecked,
    this.id,
    this.handleDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget checked() {
      return GestureDetector(
        onTap: () => changechecked(id, false),
        child: Container(
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
        ),
      );
    }

    Widget unChecked() {
      return GestureDetector(
        onTap: () => changechecked(id, true),
        child: Container(
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
        ),
      );
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
          checkedPlan! ? checked() : unChecked(),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: GestureDetector(
            onDoubleTap: () => handleDelete(id),
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
                  "${location ?? '-'}, $start - $end",
                  style: greyTextStyle.copyWith(
                    fontSize: 10,
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

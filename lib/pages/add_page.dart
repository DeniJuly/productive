import 'package:flutter/material.dart';
import 'package:productive/config/theme.dart';
import 'package:productive/service/plan_service.dart';
import 'package:productive/widget/input_date_time.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  DateTime? startDate;
  TimeOfDay? startTime;
  DateTime? endDate;
  TimeOfDay? endTime;
  TextEditingController titleController = TextEditingController(text: '');
  TextEditingController locationController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget appBar() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Add Plan',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      );
    }

    String convertDate(DateTime date, TimeOfDay time) {
      final tgl = date.day.toString().padLeft(2, '0');
      final bln = date.month.toString().padLeft(2, '0');
      final year = date.year.toString();
      final jam = time.hour.toString().padLeft(2, '0');
      final menit = time.minute.toString().padLeft(2, '0');
      return "$year-$bln-$tgl $jam:$menit";
    }

    void handleSave() async {
      Map<String, dynamic> params = {
        'title': titleController.text,
        'location': locationController.text,
        'start_date': convertDate(startDate!, startTime!),
        'end_date': convertDate(endDate!, endTime!),
        'status': false,
      };
      await PlanService().addPlan(params);
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    }

    Widget title() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Title',
            style: primaryTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            style: primaryTextStyle,
            controller: titleController,
            decoration: InputDecoration(
              filled: true,
              fillColor: whiteColor,
              hintStyle: primaryTextStyle,
              hintText: 'Enter title',
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    16,
                  ),
                ),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      );
    }

    Widget location() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Location',
            style: primaryTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            style: primaryTextStyle,
            controller: locationController,
            decoration: InputDecoration(
              filled: true,
              fillColor: whiteColor,
              hintStyle: primaryTextStyle,
              hintText: 'Enter location',
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    16,
                  ),
                ),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      );
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: defaultPadding,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                title(),
                const SizedBox(
                  height: 10,
                ),
                location(),
                const SizedBox(
                  height: 10,
                ),
                InputDateTime(
                  label: 'Start time',
                  date: startDate,
                  time: startTime,
                  onChangeDate: (DateTime date) {
                    setState(() {
                      startDate = date;
                    });
                  },
                  onChangeTime: (TimeOfDay time) {
                    setState(() {
                      startTime = time;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                InputDateTime(
                  label: 'End time',
                  date: endDate,
                  time: endTime,
                  onChangeDate: (DateTime date) {
                    setState(() {
                      endDate = date;
                    });
                  },
                  onChangeTime: (TimeOfDay time) {
                    setState(() {
                      endTime = time;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: handleSave,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 18,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16),
                      ),
                      color: primaryColor,
                    ),
                    child: Text(
                      'Simpan',
                      style: whiteTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

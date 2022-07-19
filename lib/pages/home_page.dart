import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:productive/config/theme.dart';
import 'package:productive/model/plan_model.dart';
import 'package:productive/service/plan_service.dart';
import 'package:productive/widget/chart.dart';
import 'package:productive/widget/item_plan.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: bgPageColor,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    void changechecked(String id, bool status) {
      PlanService().updStatusPlan(id, status);
    }

    void handleDelete(String id) {
      PlanService().delPlan(id);
    }

    double calculateProgress(List<PlanModel> data) {
      int count = data.length;
      if (count > 0) {
        int checked = data.where((item) => item.status == true).length;
        return (checked / count) * 100;
      }
      return 0.0;
    }

    Widget renderPlan(List<PlanModel> data) {
      double checkedProgress = calculateProgress(data);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Chart(checkedProgress: checkedProgress),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Today Plans',
            style: primaryTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: data
                .map(
                  (PlanModel e) => ItemPlan(
                    checkedPlan: e.status,
                    title: e.title,
                    location: e.location,
                    start: e.startDate!.substring(11, 16),
                    end: e.endDate!.substring(11, 16),
                    changechecked: changechecked,
                    id: e.docId,
                    handleDelete: handleDelete,
                  ),
                )
                .toList(),
          )
        ],
      );
    }

    Widget content() {
      return SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: defaultPadding,
              right: defaultPadding,
              top: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Let’s become \nmore',
                    style: primaryTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: ' Productive', style: secondaryTextStyle),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                StreamBuilder<List<PlanModel>>(
                  stream: PlanService().getPlan(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return renderPlan(snapshot.data!);
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(primaryColor),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: content(),
      floatingActionButton: GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/add'),
        child: Image.asset(
          'assets/btn_add.png',
          width: 70,
          height: 70,
        ),
      ),
    );
  }
}

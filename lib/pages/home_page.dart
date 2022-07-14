import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:productive/config/theme.dart';
import 'package:productive/provider/plan_provider.dart';
import 'package:productive/widget/chart.dart';
import 'package:productive/widget/item_plan.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    PlanProvider planProvider = Provider.of<PlanProvider>(context);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: bgPageColor,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

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
                const Chart(),
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
                  children: planProvider.plans
                      .map((e) => ItemPlan(
                            checked: false,
                            title: e.title,
                            location: e.location,
                            start: e.startTime,
                            end: e.endTime,
                          ))
                      .toList(),
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

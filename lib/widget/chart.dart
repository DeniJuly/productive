import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:productive/config/theme.dart';

class Chart extends StatefulWidget {
  double? checkedProgress;
  Chart({Key? key, this.checkedProgress}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          height: 107,
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          decoration: BoxDecoration(
            color: shadowColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
          margin: const EdgeInsets.only(
            bottom: 8,
          ),
          child: Stack(
            children: [
              Image.asset('assets/decoration.png'),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        widget.checkedProgress!.round() == 100
                            ? "Anjay, udah selesai semua bre"
                            : widget.checkedProgress!.round() > 70
                                ? 'Keren, rencanamu \nhari ini hampir selesai'
                                : "Semangat, kamu pasti bisa",
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Text(
                              "${widget.checkedProgress!.round()}%",
                              style: whiteTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
                              ),
                            ),
                            PieChart(
                              PieChartData(
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                sectionsSpace: 0,
                                centerSpaceRadius: 30,
                                sections: [
                                  PieChartSectionData(
                                    color: secondaryColor,
                                    value: widget.checkedProgress,
                                    radius: 10,
                                    title: '',
                                  ),
                                  PieChartSectionData(
                                    color: darkGreyColor,
                                    value: (100 -
                                            int.parse(widget.checkedProgress!
                                                .round()
                                                .toString()))
                                        .toDouble(),
                                    radius: 10,
                                    title: '',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

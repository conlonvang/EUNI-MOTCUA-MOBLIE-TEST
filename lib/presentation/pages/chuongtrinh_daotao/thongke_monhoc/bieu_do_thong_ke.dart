import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../apps/constants/colors.const.dart';
import '../../../../domain/entities/chuong_trinh_dao_tao/thongke_tiendo/thongke_tiendo_chart.entity.dart';
import '../../../components/shimmer_load.dart';
import 'cubit/thongke_monhoc_cubit.dart';

class BieuDoThongKeView extends StatelessWidget {
  const BieuDoThongKeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ThongKeMonHocCubit, ThongKeMonHocState>(
        builder: (context, state) {
          if (state.isLoading) {
            return Center(child: ShimmerLoading());
          }
          if (state.dataTKTD.source?.thongKeTienDoCharts == null || state.dataTKTD.source!.thongKeTienDoCharts!.isEmpty) {
            return ShimmerLoading();
          }
          return Column(
            children: [
              Expanded(
                child: SfCircularChart(
                  title: ChartTitle(text: 'Thống kê tiến độ'),
                  legend: const Legend(
                    isVisible: true,
                    overflowMode: LegendItemOverflowMode.wrap,
                    position: LegendPosition.bottom,
                  ),
                  series: <CircularSeries>[
                    PieSeries<ChartData, String>(
                      dataSource: getChartData(state.dataTKTD.source!.thongKeTienDoCharts!),
                      xValueMapper: (ChartData data, _) => "${data.xData} (${data.yData}%)",
                      yValueMapper: (ChartData data, _) => data.yData,
                      pointColorMapper: (ChartData data, _) => data.color,
                      dataLabelSettings: const DataLabelSettings(isVisible: true),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  List<ChartData> getChartData(List<ThongKeTienDoChart> charts) {
    return charts.map((chart) {
      Color color;
      try {
        color = Color(int.parse((chart.codeColor ?? '#000000').replaceAll('#', '0xff')));
      } catch (e) {
        color = AppColors.basicBlackColor;
      }
      return ChartData(
        chart.title ?? '',
        chart.trongSo ?? 0,
        color,
      );
    }).toList();
  }
}

class ChartData {
  ChartData(this.xData, this.yData, this.color);
  final String xData;
  final double yData;
  final Color color;
}

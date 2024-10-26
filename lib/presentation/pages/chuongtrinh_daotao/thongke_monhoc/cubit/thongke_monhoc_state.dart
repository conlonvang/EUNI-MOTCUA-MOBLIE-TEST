part of 'thongke_monhoc_cubit.dart';

class ThongKeMonHocState extends Equatable {
  final bool isLoading;
  final DataThongKeTienDo dataTKTD;
  final List<HeaderThongKeTienDo> headerTKTD;
  final List<SourceThongKeTienDo> sourceTKTD;
  final List<ThongKeTienDoChart> thongKeTienDoChart;
  final List<ThongKeTienDoTable> thongKeTienDoTable;
  const ThongKeMonHocState({
    this.isLoading = false,
    required this.dataTKTD,
    required this.headerTKTD,
    required this.sourceTKTD,
    required this.thongKeTienDoChart,
    required this.thongKeTienDoTable,
  });
  ThongKeMonHocState copyWith({
    bool? isLoading,
    DataThongKeTienDo? dataTKTD,
    List<HeaderThongKeTienDo>? headerTKTD,
    List<SourceThongKeTienDo>? sourceTKTD,
    List<ThongKeTienDoChart>? thongKeTienDoChart,
    List<ThongKeTienDoTable>? thongKeTienDoTable,
  }) {
    return ThongKeMonHocState(
      dataTKTD: dataTKTD ?? this.dataTKTD,
      isLoading: isLoading ?? this.isLoading,
      headerTKTD: headerTKTD ?? this.headerTKTD,
      sourceTKTD: sourceTKTD ?? this.sourceTKTD,
      thongKeTienDoChart: thongKeTienDoChart ?? this.thongKeTienDoChart,
      thongKeTienDoTable: thongKeTienDoTable ?? this.thongKeTienDoTable,
    );
  }

  @override
  List<Object> get props => [
        dataTKTD,
        isLoading,
        headerTKTD,
        sourceTKTD,
        thongKeTienDoChart,
        thongKeTienDoTable,
      ];
}

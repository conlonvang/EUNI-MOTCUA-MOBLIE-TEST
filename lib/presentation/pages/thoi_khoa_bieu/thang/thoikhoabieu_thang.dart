import 'dart:math';

import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:euni_daotao_mobile/apps/constants/colors.const.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../../../domain/entities/thoi_khoa_bieu/thoikhoabieu_monhoc.entity.dart';
import '../cubit/thoi_khoa_bieu_cubit.dart';

class ThoiKhoaBieuThang extends StatefulWidget {
  const ThoiKhoaBieuThang({super.key});

  @override
  State<ThoiKhoaBieuThang> createState() => _ThoiKhoaBieuThangState();
}

class _ThoiKhoaBieuThangState extends State<ThoiKhoaBieuThang> {
  DateTime? currentStart;
  DateTime? currentEnd;

  final Set<int> fetchedHocKy = {};

  final Map<String, Color> subjectColors = {};
  Color _getColorForSubject(String maMon) {
    if (subjectColors.containsKey(maMon)) {
      return subjectColors[maMon]!;
    }
    final color = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    subjectColors[maMon] = color;
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThoiKhoaBieuCubit, ThoiKhoaBieuState>(
      builder: (context, state) {
        final subjects = state.dataThoiKhoaBieu.source;
        DateTime parseDate(String date) {
          final parts = date.split('/');
          final day = int.parse(parts[0]);
          final month = int.parse(parts[1]);
          final year = int.parse(parts[2]);
          return DateTime(year, month, day);
        }

        return Scaffold(
          body: SfCalendar(
            showDatePickerButton: true,
            view: CalendarView.month,
            monthViewSettings: const MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
              showAgenda: true,
            ),
            dataSource: SubjectDataSource(subjects?.thoiKhoaBieuMonHocs, _getColorForSubject),
            monthCellBuilder: (context, details) {
              final appointments = details.appointments;

              return Container(
                color: Colors.transparent,
                child: Center(
                  child: Stack(
                    children: [
                      if (appointments.isNotEmpty)
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 20.0.w,
                              height: 20.0.h,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primaryBackgroundColor,
                              ),
                            ),
                          ),
                        ),
                      Center(
                        child: Text(
                          details.date.day.toString(),
                          style: TextStyle(
                            color: appointments.isNotEmpty ? AppColors.basicWhiteColor : AppColors.basicBlackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            onViewChanged: (ViewChangedDetails details) {
              final DateTime start = details.visibleDates.first;
              final DateTime end = details.visibleDates.last;
              int? currentHocKy;
              if (state.dataThoiKhoaBieu.source?.hocKies != null) {
                for (int index = 0; index < state.dataThoiKhoaBieu.source!.hocKies!.length; index++) {
                  final hocKy = state.dataThoiKhoaBieu.source!.hocKies![index];
                  final hocKyStartDate = parseDate(hocKy.ngayBatDau ?? "");
                  final hocKyEndDate = parseDate(hocKy.ngayKetThuc ?? "");

                  if ((start.isAfter(hocKyStartDate) || start.isAtSameMomentAs(hocKyStartDate)) && (end.isBefore(hocKyEndDate) || end.isAtSameMomentAs(hocKyEndDate))) {
                    if (currentHocKy != hocKy.valueHocKy) {
                      currentHocKy = hocKy.valueHocKy;
                      context.read<ThoiKhoaBieuCubit>().fetchXemThoiKhoaBieu(index);
                      break;
                    }
                  }
                }
              }
            },
            onTap: (CalendarTapDetails details) {
              if (details.appointments != null && details.appointments!.isNotEmpty) {
                final Appointment appointment = details.appointments!.first;
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    contentPadding: EdgeInsets.zero,
                    content: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.fromLTRB(7, 10, 0, 10),
                            decoration: const BoxDecoration(
                              color: AppColors.primaryBackgroundColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            width: double.infinity,
                            child: Text(
                              appointment.subject,
                              style: TextStyle(
                                fontSize: 20.0.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.basicWhiteColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                for (var note in appointment.notes!.split('\n')) Text(note, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Đóng", style: TextStyle(fontSize: 14.0.sp)),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}

class SubjectDataSource extends CalendarDataSource {
  SubjectDataSource(List<ThoiKhoaBieuMonHoc>? subjects, Color Function(String) getColorForSubject) {
    appointments = subjects?.map((subject) {
      final startTime = _convertToDateTime(subject.ngayHoc ?? "", subject.gioBatDau);
      final endTime = _convertToDateTime(subject.ngayHoc ?? "", subject.gioKetThuc);
      final color = getColorForSubject(subject.maMon ?? "");

      return Appointment(
        startTime: startTime,
        endTime: endTime,
        subject: "${subject.tenMon ?? ''} - ${subject.maMon ?? ''}\n",
        location: subject.maPhong ?? '',
        notes: "Mã môn học: ${subject.maMon ?? ''}\n"
            "Mã nhóm: ${subject.maNhom ?? ''}\n"
            "Mã lớp: ${subject.maLop ?? ''}\n"
            "Mã phòng: ${subject.maPhong ?? ''}\n"
            "Giờ bắt đầu: ${subject.gioBatDau ?? ''}\n"
            "Giờ kết thúc: ${subject.gioKetThuc ?? ''}\n"
            "Giảng viên: ${subject.tenGiangVien ?? ''}\n",
        color: color,
      );
    }).toList();
  }

  DateTime _convertToDateTime(String ngayHoc, String? time) {
    final date = DateTime.parse(ngayHoc);

    if (time == null) {
      return date;
    }

    final timeParts = time.split(":");
    final hours = int.parse(timeParts[0]);
    final minutes = int.parse(timeParts[1]);

    return DateTime(date.year, date.month, date.day, hours, minutes);
  }
}

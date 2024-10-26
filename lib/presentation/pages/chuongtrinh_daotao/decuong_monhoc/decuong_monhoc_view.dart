import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../apps/constants/colors.const.dart';
import '../../../../data/repositories/decuongmonhoc_euni_api_datasource.dart';
import '../../../components/header_screen.dart';
import 'decuong_monhoc/decuong_monhoc_cubit.dart';

class DeCuongMonHocView extends StatefulWidget {
  final String maMonHoc;
  const DeCuongMonHocView({
    super.key,
    required this.maMonHoc,
  });

  @override
  State<DeCuongMonHocView> createState() => _DeCuongMonHocViewState();
}

class _DeCuongMonHocViewState extends State<DeCuongMonHocView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeCuongMonHocCubit(DeCuongMonHocEuniApiDataSource())..fetchDeCuongMonHoc(widget.maMonHoc),
      child: BlocBuilder<DeCuongMonHocCubit, DeCuongMonHocState>(
        builder: (context, state) {
          final data = state.dataDCMH.results ?? [];
          return Scaffold(
            body: Column(
              children: [
                HeaderWidgetEuni(
                  title: 'Đề cương môn học',
                  backgroundColor: AppColors.primaryBackgroundColor,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.basicWhiteColor,
                      size: 24.sp,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final item = data[index];
                      final title = item.title ?? '';
                      final value = item.value ?? '';
                      final isLink = item.isLink ?? false;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Expanded(
                              child: isLink
                                  ? GestureDetector(
                                      onTap: () async {
                                        final uri = Uri.parse(value);
                                        if (await canLaunchUrl(uri)) {
                                          await launchUrl(uri, mode: LaunchMode.externalApplication);
                                        } else {
                                          throw 'Could not launch $uri';
                                        }
                                      },
                                      child: const Text(
                                        'Tải xuống file',
                                        style: TextStyle(
                                          color: AppColors.blueShade300,
                                        ),
                                      ),
                                    )
                                  : Text(value),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
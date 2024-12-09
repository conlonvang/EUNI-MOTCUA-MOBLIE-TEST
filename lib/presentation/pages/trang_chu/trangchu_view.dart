import 'package:carousel_slider/carousel_slider.dart';
import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:euni_daotao_mobile/apps/constants/box_hive_local.const.dart';
import 'package:flutter/material.dart';
import '../../../apps/configs/injection.dart';
import '../../../apps/configs/service_location.dart';
import '../../../routers/routes.name.dart';
import '../../components/icon_trang_chu.dart';
import 'cubit/trang_chu_cubit.dart';
import 'widget/drawer_menu.dart';
import 'widget/icon_selection.dart';

class TrangChuView extends StatefulWidget {
  const TrangChuView({super.key});

  @override
  State<TrangChuView> createState() => _TrangChuViewState();
}

class _TrangChuViewState extends State<TrangChuView> {
  String setAvatar(String avatar) {
    final slipText = avatar.split(" ");
    final avatarText2 = slipText[slipText.length - 1][0];
    final avatarText = slipText[0][0];
    return avatarText.toUpperCase() + avatarText2.toUpperCase();
  }

  final box = Hive.box(BoxHiveLocalDaoTao.dbHiveLocalDaoTao);
  List<IconTrangChu> iconTrangChu = [
    IconTrangChu(
      title: "Thời khóa biểu",
      bgIconColor: const Color(0xffF13838),
      route: RouteConfigName.THOI_KHOA_BIEU,
      icon: Icons.calendar_month_outlined,
    ),
    IconTrangChu(
      title: "Xem điểm",
      bgIconColor: const Color(0xff2CA5FF),
      route: RouteConfigName.XEM_DIEM,
      icon: Icons.list_alt,
    ),
    IconTrangChu(
      title: "Lịch thi",
      bgIconColor: const Color(0xff5A21FB),
      route: RouteConfigName.DEFAULT,
      icon: Icons.access_time,
    ),
    IconTrangChu(
      title: "Đăng ký môn",
      bgIconColor: const Color(0xff445FEA),
      route: RouteConfigName.DEFAULT,
      icon: Icons.list_alt,
    ),
    IconTrangChu(
      title: "Học phí",
      bgIconColor: const Color(0xff05D370),
      route: RouteConfigName.HOC_PHI,
      icon: Icons.list_alt,
    ),
    IconTrangChu(
      title: "Điểm danh",
      bgIconColor: const Color(0xff2CA5FF),
      route: RouteConfigName.DEFAULT,
      icon: Icons.list_alt,
    ),
    IconTrangChu(
      title: "Đồ án tốt nghiệp",
      bgIconColor: const Color(0xff6105D5),
      route: RouteConfigName.DEFAULT,
      icon: Icons.list_alt,
    ),
    IconTrangChu(
      title: "Hướng nghiệp việc làm",
      bgIconColor: const Color(0xffF13838),
      route: RouteConfigName.DEFAULT,
      icon: Icons.list_alt,
    ),
    IconTrangChu(
      title: "Chương trình đào tạo",
      bgIconColor: const Color(0xff1C77FF),
      route: RouteConfigName.CHONCHUCNANGCTDT,
      icon: Icons.list_alt,
    ),
    IconTrangChu(
      title: "Hồ sơ",
      bgIconColor: const Color(0xffF13838),
      route: RouteConfigName.DEFAULT,
      icon: Icons.list_alt,
    ),
    IconTrangChu(
      title: "Điểm rèn luyện",
      bgIconColor: const Color(0xff2CA5FF),
      route: RouteConfigName.DEFAULT,
      icon: Icons.list_alt,
    ),
    IconTrangChu(
      title: "Tin tức",
      bgIconColor: const Color(0xff05D370),
      route: RouteConfigName.DEFAULT,
      icon: Icons.list_alt,
    ),
    IconTrangChu(
      title: "Thông báo",
      bgIconColor: const Color(0xff5A21FB),
      route: RouteConfigName.DEFAULT,
      icon: Icons.list_alt,
    ),
    IconTrangChu(
      title: "Gửi ý kiến",
      bgIconColor: const Color(0xff1C77FF),
      route: RouteConfigName.DEFAULT,
      icon: Icons.list_alt,
    ),
    IconTrangChu(
      title: "Quy chế quy định",
      bgIconColor: const Color(0xff6105D5),
      route: RouteConfigName.DEFAULT,
      icon: Icons.list_alt,
    ),
    IconTrangChu(
      title: "Giới thiệu",
      bgIconColor: const Color(0xff05D370),
      route: RouteConfigName.DEFAULT,
      icon: Icons.list_alt,
    ),
  ];

  List<String> carouselItems = [
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
        child: DrawerMenu(
          onLanguageChanged: () {
            setState(() {});
          },
        ),
      ),
      backgroundColor: const Color(0xffF5F5F5),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TrangChuCubit()..initTrangChu(),
          ),
        ],
        child: BlocBuilder<TrangChuCubit, TrangChuState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: box.get(BoxHiveLocalDaoTao.tokenDaoTao) != null ? 250.h : 300,
                    decoration: BoxDecoration(
                      color: box.get(BoxHiveLocalDaoTao.tokenDaoTao) != null ? Colors.blue : Colors.red,
                      borderRadius: box.get(BoxHiveLocalDaoTao.tokenDaoTao) != null
                          ? BorderRadius.zero
                          : const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 50.h),
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            leading: const Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                            title: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Chào, ${box.get(BoxHiveLocalDaoTao.nameDaoTao) ?? ""}",
                                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                                    ),
                                    SizedBox(height: 10.h),
                                    Text(
                                      "${box.get(BoxHiveLocalDaoTao.usernameDaoTao) ?? ""}",
                                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                InkWell(
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      right: 20.0,
                                    ),
                                    width: 40.h,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Center(
                                      child: Text(
                                        setAvatar("${box.get(BoxHiveLocalDaoTao.nameDaoTao)}"),
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 300.h),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 17.w),
                              child: Text(
                                "Thông Báo",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: GestureDetector(
                                child: InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Text(
                                        "Xem tất cả",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const Icon(Icons.keyboard_arrow_right_outlined)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 200.h,
                            autoPlay: true,
                            enlargeCenterPage: true,
                          ),
                          items: carouselItems.map((item) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  margin: const EdgeInsets.all(5.0),
                                  child: Image.network(item, fit: BoxFit.cover),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 17.w),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Danh mục",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        if (state.isLoading == false) ...{
                          GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 1.h,
                              mainAxisSpacing: 1.0.h,
                              crossAxisSpacing: 1.0.h,
                            ),
                            itemCount: iconTrangChu.length,
                            itemBuilder: (BuildContext context, int index) {
                              return IconSelection(
                                color: iconTrangChu[index].bgIconColor,
                                icon: iconTrangChu[index].icon,
                                title: iconTrangChu[index].title,
                                onTap: () {
                                  getIt<NavigationService>().toNamed(iconTrangChu[index].route);
                                },
                              );
                            },
                          ),
                        }
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

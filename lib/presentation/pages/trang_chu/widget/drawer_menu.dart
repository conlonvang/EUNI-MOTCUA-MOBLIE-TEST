
import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:euni_daotao_mobile/apps/constants/box_hive_local.const.dart';
import 'package:flutter/material.dart';

import '../../../../apps/store/authen/authen_cubit.dart';
import '../../../../routers/factory_routes_singleton.dart';
import '../../../../routers/routes.name.dart';

class DrawerMenu extends StatefulWidget {
  final Function onLanguageChanged;
  const DrawerMenu({
    super.key,
    required this.onLanguageChanged,
  });

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  final box = Hive.box(BoxHiveLocalDaoTao.dbHiveLocalDaoTao);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenCubit(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.h,
          ),
          box.get(BoxHiveLocalDaoTao.nameDaoTao) == null
              ? Image.asset(
                  "assets/images/Logo-HIT.jpg",
                  width: 80.w,
                )
              : ListTile(
                  title: Text("${box.get(BoxHiveLocalDaoTao.nameDaoTao)}"),
                  leading: Image.asset(
                    "assets/images/Logo-HIT.jpg",
                    width: 40.w,
                  ),
                ),
          box.get(BoxHiveLocalDaoTao.nameDaoTao) == null
              ? Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Divider(),
                        Column(
                          children: [
                            ListTile(
                              onTap: () {
                                context.pop();
                                context.push(RouteConfigName.DANGNHAP);
                              },
                              leading: const Icon(Icons.login),
                              title: Text("log_in"),
                            ),
                            const Divider(),
                            // ListTile(
                            //   onTap: () async {
                            //     await context.push(RouteConfigName.NGONNGU);
                            //     widget.onLanguageChanged();
                            //   },
                            //   leading: const Icon(Icons.language),
                            //   title: Text("language".tr()),
                            // ),
                          ],
                        ),
                        const Spacer(),
                        ListTile(
                          onTap: () {
                            if (FactoryNavRoutesSingleton().isMiniApp) {
                              box.clear();
                              FactoryNavRoutesSingleton().goToRoot();
                            } else {
                              context.pop();
                            }
                          },
                          leading: const Icon(Icons.home_outlined),
                          title: Text("return_to_the_main_screen"),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        )
                      ],
                    ),
                  ),
                )
              : Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Divider(),
                            // ListTile(
                            //   onTap: () {
                            //     context.push(RouteConfigName.THONGTINCANHAN);
                            //   },
                            //   leading: const Icon(Icons.person_2),
                            //   title: Text("personal_information"),
                            // ),
                            // const Divider(),
                            // ListTile(
                            //   onTap: () async {
                            //     await context.push(RouteConfigName.NGONNGU);
                            //     widget.onLanguageChanged();
                            //   },
                            //   leading: const Icon(Icons.language),
                            //   title: Text("language"),
                            // ),
                          ],
                        ),
                        const Spacer(),
                        Center(
                          child: BlocBuilder<AuthenCubit, AuthenState>(
                            builder: (context, state) {
                              return ListTile(
                                onTap: () {
                                  context.read<AuthenCubit>().logout();
                                },
                                leading: const Icon(Icons.logout),
                                title: Text("log_out"),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

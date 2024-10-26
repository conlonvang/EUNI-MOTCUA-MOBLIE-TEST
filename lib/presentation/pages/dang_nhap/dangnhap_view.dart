import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:euni_daotao_mobile/apps/constants/colors.const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../apps/configs/config_loading.dart';
import '../../../apps/configs/package_info.dart';
import '../../../data/repositories/tai_khoan.repository.dart';
import '../../../routers/routes.name.dart';
import 'cubit/hint_password_cubit.dart';

class DangNhapView extends StatefulWidget {
  const DangNhapView({super.key});

  @override
  State<DangNhapView> createState() => _DangNhapViewState();
}

class _DangNhapViewState extends State<DangNhapView> {
  TextEditingController? username;
  TextEditingController? password;
  TaiKhoanRepository taiKhoanRepository = TaiKhoanRepository();
  final formValidationManager = FormValidationManager();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  String version = "";
  Future<void> init() async {
    final vs = await PageRouteInfoApi.getAppVersion();
    setState(() {
      version = vs;
    });
  }


  @override
  void initState() {
    super.initState();
    username = TextEditingController();
    password = TextEditingController();
    init();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HintPasswordCubit()..checkHintPassword(),
      child: Scaffold(
        body: Form(
          key: _form,
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Column(
                    children: [
                      AppBar(
                        centerTitle: true,
                        title:  Text("Đăng nhập"),
                        // leading: IconButton(
                        //   icon: const Icon(Icons.arrow_back_ios_new),
                        //   onPressed: () {
                        //     context.pop();
                        //   },
                        // ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      ImageAsset(
                        path: "assets/images/Logo-HIT.jpg",
                        widthImage: 240.w,
                      ),
                      TextTitleAtom(
                        text:"HUMG EUNI",
                        color: const Color(0xff0F6696),
                        fontSize: 40.sp,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      BaseInputText(
                        fontSize: 14.sp,
                        formValidationManager: formValidationManager,
                        rules: "required",
                        name: "Tài khoản",
                        onChanged: (value, status) {
                          username?.text = value;
                        },
                        id: "taiKhoan",
                        title: "Tài khoản",
                      ),
                      BlocBuilder<HintPasswordCubit, HintPasswordState>(
                        builder: (context, state) {
                          return BaseInputText(
                            fontSize: 14.sp,
                            obscureText: state.isHintPassword,
                            formValidationManager: formValidationManager,
                            rules: "required",
                            name: "Mật khẩu",
                            onChanged: (value, status) {
                              password?.text = value;
                            },
                            id: "matKhau",
                            title: "Mật khẩu",
                            suffixIcon: IconButton(
                              onPressed: () {
                                context.read<HintPasswordCubit>().checkHintPassword();
                              },
                              icon: !state.isHintPassword
                                  ? Icon(
                                      Icons.password_outlined,
                                      size: 25.sp,
                                    )
                                  : Icon(
                                      Icons.visibility_outlined,
                                      size: 25.sp,
                                    ),
                            ),
                          );
                        },
                      ),
                      // Align(
                      //   alignment: Alignment.topRight,
                      //   child: TextButton(
                      //     onPressed: () {},
                      //     child: Text(
                      //       "Quên mật khẩu",
                      //       style: TextStyle(fontSize: 14.sp, color: AppColor.mainColor),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 14.h,
                      ),
                      ButtonDefaultAtom(
                        fontSize: 16.sp,
                        size: Size(
                          MediaQuery.of(context).size.width * 0.9,
                          50.h,
                        ),
                        title: "Đăng nhập",
                        onPressed: () async {
                          if (!_form.currentState!.validate()) {
                            formValidationManager.erroredFields.first.focusNode.requestFocus();
                          } else {
                            EasyLoadingCustom.instance.loading("Loading...");
                            var result = await taiKhoanRepository.dangNhapAsync(username: username!.text, password: password!.text);
                            result.fold((l) {
                              EasyLoadingCustom.instance.dismiss();
                              AlertModule().show(
                                context: context,
                                title: l.message,
                                backgroundColor: AppColors.basicWhiteColor,
                                alertType: AlertType.error,
                              );
                            }, (r) {
                              context.push(RouteConfigName.TRANGCHU);
                              EasyLoadingCustom.instance.dismiss();
                            });
                          }
                        },
                        textColor: AppColors.basicWhiteColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

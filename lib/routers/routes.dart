part of 'routes.package.dart';

RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
GoRouter routerGoRoutes = GoRouter(
  initialLocation: RouteConfigName.DEFAULT,
  debugLogDiagnostics: true,
  routes: [
    ShellRoute(
      navigatorKey: getIt<NavigationService>().navigatorKey,
      builder: (context, state, child) {
        return child;
      },
      routes: <GoRoute>[
        GoRoute(
          path: RouteConfigName.DEFAULT,
          builder: (_, GoRouterState state) => const RouteAwareWidget(
            child: DangNhapView(),
          ),
        ),
        GoRoute(
          path: RouteConfigName.TRANGCHU,
          builder: (_, GoRouterState state) => const RouteAwareWidget(
            child: TrangChuView(),
          ),
        ),
        GoRoute(
          path: RouteConfigName.DANGNHAP,
          builder: (_, GoRouterState state) => const RouteAwareWidget(
            child: DangNhapView(),
          ),
        ),
        GoRoute(
          path: RouteConfigName.CHONCHUCNANGCTDT,
          builder: (_, GoRouterState state) => const RouteAwareWidget(
            child: ChonChucNangCTDT(),
          ),
        ),
        GoRoute(
          path: RouteConfigName.CHUONGTRINHDAOTAO,
          builder: (_, GoRouterState state) => const RouteAwareWidget(
            child: ChuongTrinhDaoTaoView(),
          ),
        ),
        GoRoute(
          path: RouteConfigName.THONG_KE_CTDT,
          builder: (_, GoRouterState state) => const RouteAwareWidget(
            child: ThongKeView(),
          ),
        ),
        GoRoute(
          path: RouteConfigName.MON_HOC_TU_CHON,
          builder: (_, GoRouterState state) => RouteAwareWidget(
            child: MonHocTuChonEuniView(),
          ),
        ),
        GoRoute(
            path: RouteConfigName.DE_CUONG_MON_HOC,
            builder: (_, GoRouterState state) {
              final maMonHoc = state.uri.queryParameters['maMonHoc'] ?? '';
              return RouteAwareWidget(
                child: DeCuongMonHocView(
                  maMonHoc: maMonHoc,
                ),
              );
            }),
        GoRoute(
          path: RouteConfigName.XEM_DIEM,
          builder: (_, GoRouterState state) => const RouteAwareWidget(
            child: XemDiemView(),
          ),
        ),
        GoRoute(
          path: RouteConfigName.HOC_PHI,
          builder: (_, GoRouterState state) => const RouteAwareWidget(
            child: HocPhiView(),
          ),
        ),
         GoRoute(
          path: RouteConfigName.THOI_KHOA_BIEU,
          builder: (_, GoRouterState state) => const RouteAwareWidget(
            child: ThoiKhoaBieuView(),
          ),
        ),
      ],
    ),
  ],
);

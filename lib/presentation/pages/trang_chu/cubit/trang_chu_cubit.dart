
import 'package:euni_core_ui/euni_core_ui.dart';
import '../../../components/icon_trang_chu.dart';
part 'trang_chu_state.dart';

class TrangChuCubit extends Cubit<TrangChuState> {
  List<IconTrangChu> iconTrangChu = [];
 // final box = Hive.box(BoxHiveLocalMotCua.dbHiveLocalMotCua);

  TrangChuCubit()
      : super(TrangChuState(
          isLoading: true,
          totalHoSo: 0,
          dangXuLy: 0,
          hoanThanh: 0,
        //  selectedLanguage: "${Hive.box(BoxHiveLocalDaoTao.dbHiveLocalDaoTao).get(BoxHiveLocalDaoTao.selectedLanguage) ?? ELanguage.tiengViet.value}",
        ));

  void initTrangChu() {
    emit(
      state.copyWith(
        isLoading: false,
      ),
    );
  }

  void updateCounts(int totalHoSo, int dangXuLy, int hoanThanh) {
    emit(
      state.copyWith(
        totalHoSo: totalHoSo,
        dangXuLy: dangXuLy,
        hoanThanh: hoanThanh,
      ),
    );
  }

  // Future<void> changeLanguage(BuildContext context, String language) async {
  //   Locale newLocale;
  //   ELanguage? selectedLanguage = ELanguage.fromValue(language);
  //   switch (selectedLanguage) {
  //     case ELanguage.tiengViet:
  //       newLocale = const Locale('vi', 'VN');
  //       break;
  //     case ELanguage.tiengAnh:
  //       newLocale = const Locale('en', 'US');
  //       break;
  //     default:
  //       newLocale = const Locale('vi', 'VN');
  //   }

  //   await context.setLocale(newLocale);
  //   emit(state.copyWith(selectedLanguage: language));
  //   await box.put(BoxHiveLocalMotCua.selectedLanguage, language);
  // }

  // Future<void> loadSelectedLanguage() async {
  //   String? savedLanguage = box.get(BoxHiveLocalDaoTao.selectedLanguage);
  //   if (savedLanguage != null) {
  //     emit(state.copyWith(selectedLanguage: savedLanguage));
  //   }
  // }
}


import 'package:euni_core_ui/euni_core_ui.dart';


part 'hint_password_state.dart';

class HintPasswordCubit extends Cubit<HintPasswordState> {
  HintPasswordCubit() : super(const HintPasswordState(isHintPassword: false));
  void checkHintPassword() {
    emit(state.copyWith(isHintPassword: !state.isHintPassword));
  }
}

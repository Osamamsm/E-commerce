import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckoutFlowCubit extends Cubit<int> {
  CheckoutFlowCubit() : super(0);

  void goToNextStep() {
    if (state < 2) emit(state + 1);
  }

  void goToPreviousStep() {
    if (state > 0) emit(state - 1);
  }

  void goToStep(int step) {
    emit(step);
  }
}

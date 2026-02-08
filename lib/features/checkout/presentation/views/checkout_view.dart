import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/features/checkout/presentation/logic/checkout_flow_cubit/checkout_flow_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/checkout_view_body.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  static String routeName = "/checkout";
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CheckoutFlowCubit>();
    return BlocBuilder<CheckoutFlowCubit, int>(
      builder: (context, state) {
        return PopScope(
          canPop: state == 0,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) return;
            cubit.goToPreviousStep();
          },
          child: CustomScaffold(
            title: S.of(context).checkout,
            child: CheckoutViewBody(),
          ),
        );
      },
    );
  }
}

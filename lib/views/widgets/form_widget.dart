import 'package:credit_card/views/widgets/input_field_widget.dart';
import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputFieldWidget(label: 'Número do Cartão'),
        InputFieldWidget(label: 'Nome do Titular'),
        InputFieldWidget(label: 'Data de Validade'),
      ],
    );
  }
}

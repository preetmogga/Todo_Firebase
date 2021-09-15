import 'package:flutter/material.dart';
import 'package:todo_firebase/UI/Style/m_color.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required TextEditingController controller,
    required FocusNode focusNode,
    required TextInputType keyboardType,
    required TextInputAction inputAction,
    required String label,
    required String hint,
    required String initalValue,
    required Function(String value) validator,
    this.isObscure = false,
    this.isCapitalized = false,
    this.maxLines = 1,
    this.isLabelEnable = true,
  })  : _keyboardType = keyboardType,
        _validator = validator,
        _inputAction = inputAction,
        _label = label,
        _hint = hint,
        _initialValue = initalValue,
        super(key: key);

  final TextInputType _keyboardType;
  final TextInputAction _inputAction;
  final String _label;
  final String _hint;
  final String _initialValue;
  final bool isObscure;
  final bool isCapitalized;
  final int maxLines;
  final bool isLabelEnable;
  final Function(String) _validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: _initialValue,
      maxLines: maxLines,
      keyboardType: _keyboardType,
      obscureText: isObscure,
      textCapitalization:
          isCapitalized ? TextCapitalization.words : TextCapitalization.none,
      textInputAction: _inputAction,
      cursorColor: MyColor.fire,
      validator: (value) => _validator(value!),
      decoration: InputDecoration(
        labelText: isLabelEnable ? _label : null,
        labelStyle: TextStyle(color: MyColor.fire),
        hintText: _hint,
        hintStyle: TextStyle(color: MyColor.fire),
        errorStyle:
            TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(width: 2, color: MyColor.fire),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(width: 2, color: Colors.blueGrey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(width: 2, color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(width: 2, color: Colors.redAccent),
        ),
      ),
    );
  }
}

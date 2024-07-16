import '../helpers/all_imports.dart';

class MainTextField extends StatelessWidget {
  const MainTextField({
    super.key,
    this.controller,
    this.hint,
    this.label,
    this.readOnly = false,
    this.keyboardType,
    this.prefixIcon,
    this.enabled = true,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.obscureText = false,
    this.textInputAction,
    this.focusNode,
    this.autofillHints,
    this.maxLength,
    this.padding = const EdgeInsets.symmetric(vertical: 8.0),
    this.minLines,
    this.maxLines = 1,
    this.suffixIcon,
    this.inputFormatters,
  });

  final TextEditingController? controller;
  final String? hint;
  final String? label;
  final bool readOnly;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final void Function(String?)? onFieldSubmitted;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final List<String>? autofillHints;
  final int? maxLength;
  final EdgeInsetsGeometry padding;
  final int? minLines;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    // final FocusNode defaultFocusNode = focusNode ?? FocusNode();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        autofillHints: autofillHints,
        obscureText: obscureText,
        readOnly: readOnly,
        enabled: enabled,
        keyboardType: keyboardType,
        focusNode: focusNode,
        textInputAction: textInputAction,
        maxLength: maxLength,
        minLines: minLines,
        maxLines: maxLines,
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: customTheme.black,
        ),
        decoration: InputDecoration(
          fillColor: customTheme.grey,
//           width: 334,
// height: 49,

          filled: true,
          labelText: label,
          labelStyle: TextStyle(fontSize: 14.0, color: customTheme.darkGrey),
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.secondary,
            fontFamily: 'Cairo',
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: prefixIcon,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 7.0),
          prefixIconColor: theme.colorScheme.primary,
          prefixIconConstraints: const BoxConstraints(
            maxHeight: 30.0,
            maxWidth: 38.0,
          ),
          suffixIcon: suffixIcon,
          suffixIconConstraints: const BoxConstraints(
            maxHeight: 60.0,
            maxWidth: 85.0,
          ),
          border: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: customTheme.grey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: customTheme.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: customTheme.grey,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: customTheme.grey,
            ),
          ),
          errorBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: customTheme.grey,
            ),
          ),
        ),
        inputFormatters: inputFormatters,
        validator: validator,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}

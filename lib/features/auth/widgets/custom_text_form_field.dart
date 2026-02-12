import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    required this.title,
    required this.hintText,
    required this.controller,
    this.icon,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    super.key,
  });
  final IconData? icon;
  final String title;
  final TextInputType? keyboardType;
  final String hintText;
  final bool isPassword;

  final TextEditingController? controller;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

typedef Validator = Function(String?)? ;

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: .start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: .w400,
            color: Color(0xff706C7E),
          ),
        ),

        TextFormField(
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          obscureText: _isObscured,
          decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      _isObscured = !_isObscured;
                      setState(() {});
                    },
                    icon: _isObscured
                        ? Icon(Icons.visibility_off_outlined)
                        : Icon(Icons.visibility_outlined),
                  )
                : Icon(widget.icon),
            hint: Text(
              widget.hintText,
              style: TextStyle(
                fontWeight: .w400,
                fontSize: 14,
                color: Color(0xff7F7F7F),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xff000000)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xffFF4949)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xffBABABA)),
            ),
          ),
        ),
      ],
    );
  }
}

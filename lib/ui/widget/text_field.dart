import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../util/constants/app_colors.dart';

class MyTextField extends StatefulWidget {
  MyTextField({
    required this.onChanged,
    required this.textValue,
    this.hintText = '',
    this.infoText = '',
    this.isPassword = false,
    super.key,
  });

  List<Object> Function(String text) onChanged;
  String textValue;
  String hintText;
  String infoText;
  bool isPassword;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  var _textFieldBorderColor = AppColors.grayLight3;
  final TextEditingController _controller = TextEditingController();
  var _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _controller.text = widget.textValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.infoText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                      fontSize: 12,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Visibility(
                visible: _textFieldBorderColor == AppColors.redError,
                child: Text(
                  _errorMessage,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        fontSize: 12,
                        color: AppColors.redError,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.grayLight3,
            border: Border.all(
              width: 1,
              color: _textFieldBorderColor,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.h)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 4),
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                List<Object> result = widget.onChanged(value);
                if (result[0] != _textFieldBorderColor) {
                  setState(() {
                    _textFieldBorderColor = result[0] as Color;
                  });
                }
                setState(() {
                  widget.textValue = value;
                  if (_textFieldBorderColor == AppColors.redError) {
                    _errorMessage = result[1] as String;
                  }
                });
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
              ),
              obscureText: widget.isPassword,
            ),
          ),
        ),
      ],
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
//
// import 'package:dfzagency/dfz.dart';
//
// class AppTextFieldWithLabel extends StatefulWidget {
//   final Key key;
//   final String label;
//   final TextInputAction textInputAction;
//   final TextEditingController controller;
//   final String initialValue;
//   final double width;
//   final EdgeInsets margin;
//   final EdgeInsets padding;
//   final String hint;
//   final int maxLine;
//   final int minLine;
//   final TextInputType keyboardType;
//   final Widget icon;
//   final Widget prefixIcon;
//   final Function() onTap;
//   final bool readOnly;
//   final ValueChanged<String> onSubmitted;
//   // 'void Function(dynamic)?'
//   final ValueChanged<String?>? validatorFunction;
//   final ValueChanged<String?> onSaveFunction;
//   final ValueChanged<String> onChange;
//   final FocusNode focusNode;
//   final String errorText;
//   final bool isPassword;
//   final TextAlign textAlign;
//   final bool obsecureText;
//   final Color borderColor;
//   final double borderWidth;
//   final List<TextInputFormatter> inputFormatter;
//   final bool enabled;
//   final Function() onTextFieldTap;
//   final bool isChangePassword;
//   final int maxLength;
//   final Widget suffixIcon;
//   final String tooltipMessage;
//   final bool expands;
//
//   AppTextFieldWithLabel({
//     required this.key,
//     required this.label,
//     this.textInputAction = TextInputAction.done,
//     required this.validatorFunction,
//     required this.initialValue,
//     required this.onSaveFunction,
//     required this.onChange,
//     required this.focusNode,
//     required this.onSubmitted,
//     required this.controller,
//     this.width = 300,
//     this.margin = const EdgeInsets.symmetric(vertical: 4),
//     this.padding = const EdgeInsets.symmetric(horizontal: 0),
//     this.hint = '',
//     this.maxLine = 1,
//     this.minLine = 1,
//     this.keyboardType = TextInputType.text,
//     required this.icon,
//     required this.onTap,
//     this.readOnly = false,
//     required this.obsecureText,
//     this.textAlign = TextAlign.center,
//     required this.prefixIcon,
//     required this.errorText,
//     this.isPassword = false,
//     this.borderColor = Colors.grey,
//     this.borderWidth = 1,
//     required this.inputFormatter,
//     this.enabled = true,
//     required this.onTextFieldTap,
//     this.isChangePassword = false,
//     required this.maxLength,
//     required this.suffixIcon,
//     required this.tooltipMessage,
//     this.expands = false,
//   });
//
//   @override
//   _AppTextFieldWithLabelState createState() => _AppTextFieldWithLabelState();
// }
//
// class _AppTextFieldWithLabelState extends State<AppTextFieldWithLabel> {
//   bool show = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Text(
//               widget.label ?? '',
//               style: TextStyle(
//                 color: labelTextColor,
//                 fontSize: 14.0,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: AppSize.spaceX8),
//         TextFormField(
//           key: widget.key,
//           initialValue: widget.initialValue,
//           focusNode: widget.focusNode,
//           controller: widget.controller,
//           maxLength: widget.maxLength,
//           onTap: widget.onTextFieldTap,
//           obscureText: widget.isPassword ? show : false,
//           enabled: widget.enabled,
//           onChanged: widget.onChange,
//           onSaved: widget.onSaveFunction,
//           onFieldSubmitted: widget.onSubmitted,
//           validator: widget.validatorFunction,
//           keyboardType: widget.keyboardType,
//           inputFormatters: widget.inputFormatter,
//           expands: widget.expands,
//            maxLines: widget.maxLine,
//           minLines: widget.minLine,
//           style: TextStyle(
//             color: widget.enabled ? darkTextColor : grayColor,
//           ),
//
//           decoration: InputDecoration(
//             hintText: widget.hint,
//             counterText: '',
//             enabled: widget.enabled,
//             errorText: widget.errorText,
//             hintStyle: TextStyle(fontSize: 14.0),
//             contentPadding: EdgeInsets.symmetric(
//               vertical: 18.0,
//               horizontal: 16.0,
//             ),
//             floatingLabelBehavior: FloatingLabelBehavior.never,
//             border: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: lightColor,
//                 width: 1,
//               ),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: lightColor,
//                 width: 1,
//               ),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: lightColor,
//                 width: 1,
//               ),
//             ),
//             errorBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: lightColor,
//                 width: 1,
//               ),
//             ),
//             focusedErrorBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: lightColor,
//                 width: 1,
//               ),
//             ),
//             suffixIcon: widget.isPassword
//                 ? IconButton(
//                     icon: Icon(
//                       show ? EvaIcons.eye : EvaIcons.eyeOff,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         show = !show;
//                       });
//                     },
//                   )
//                 : null,
//           ),
//         ),
//       ],
//     );
//   }
// }

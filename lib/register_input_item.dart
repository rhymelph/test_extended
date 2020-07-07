import 'package:flutter/material.dart';


double getDp(num value)=>value;

class RegisterInputItem extends StatelessWidget {
  final bool isNeed;
  final String tip;
  final Widget right;
  final ValueChanged<String> onChange;
  final Widget left;
  final TextInputType keyboardType;
  final VoidCallback onEditingComplete;
  final FocusNode focusNode;

  const RegisterInputItem(
      {Key key, this.isNeed = true, this.focusNode,this.tip, this.left,this.right, this.onChange,this.onEditingComplete,this.keyboardType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: isNeed ? getDp(34) : getDp(44),
        vertical: getDp(12),
      ),
      child: Row(
        children: [
          if(left!=null) left,
          Expanded(
              child: Container(
            height: getDp(42),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(getDp(5)),
                border: Border.all(
                  width: getDp(1),
                )),
            alignment: Alignment.centerLeft,
            child: TextFormField(
              focusNode: focusNode,
              onChanged: onChange,
              onEditingComplete: onEditingComplete,
              obscureText: keyboardType == TextInputType.visiblePassword,
              keyboardType: keyboardType,
              cursorColor: Theme.of(context).primaryColor,
              scrollPadding: EdgeInsets.zero,
//                backgroundCursorColor: Theme.of(context).primaryColor, cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  left: getDp(11),
                  right: getDp(10),
                  bottom: getDp(10),
                ),
                hintText: tip,
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          )),
          if (right != null) right,
        ],
      ),
    );
  }
}

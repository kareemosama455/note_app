import 'package:flutter/material.dart';

Widget defaultformfield(
        {IconData? prefixicon,
        required TextEditingController? controller,
        required TextInputType? type,
        Function? onSubmit,
        Function? onchanged,
        bool isPassword = false,
        required String? hinttext,
        Color? prefixcolor = Colors.purple,
        String? Function(String?)? validate,
        Function()? ontap,
        bool isClickable = true}) =>
    TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        obscureText: isPassword,
        onTap: ontap,
        validator: validate,
        enabled: isClickable,
        decoration: InputDecoration(
            hintText: hinttext,
            prefix: Icon(prefixicon),
            prefixIconColor: prefixcolor));


Widget buildtaskitem(Map model) =>   Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            child: Text('${model['time']}'),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${model['title']}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text('${model['date']}'),
            ],
          )
        ],
      ),
    );

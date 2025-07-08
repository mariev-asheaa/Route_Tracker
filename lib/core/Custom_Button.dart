import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,required this.onPressed});
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed:onPressed,
       style: ButtonStyle(
  backgroundColor:  WidgetStatePropertyAll<Color>(Colors.white),
         ),
        child: Text('get directions',style: TextStyle(color: Colors.black,fontSize: 16),),
    );
  }
}

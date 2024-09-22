
import 'package:flutter/material.dart';

class roundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;
  const roundedButton(
      {super.key,
      required this.title,
      this.loading = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.blueGrey),
        child: Center(child:  loading
            ?  CircularProgressIndicator(strokeWidth: 3,color: Colors.white,)
            : Text(
            title,
            style: const TextStyle(color: Colors.white),
                          ) ,)
        
        
      
      ),
    );
  }
}

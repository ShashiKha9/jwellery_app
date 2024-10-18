import 'package:flutter/material.dart';
import 'package:jwellery_app/app/theme/app_theme.dart';


class LabeledTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  bool hidePassword;
  final TextInputType keyboardType;

  LabeledTextField({super.key, 
  
    required this.label,
    required this.hintText,
    required this.controller,
    required this.isPassword,
    this.hidePassword = false,
    this.keyboardType=TextInputType.name,
  });

  @override
  State<LabeledTextField> createState() => _LabeledTextFieldState();
}

class _LabeledTextFieldState extends State<LabeledTextField> {
  String hintText='';
  Color hintColor= Colors.grey.shade300.withOpacity(0.8);


  //   @override
  // void initState() {
  //   super.initState();
  //   hintText = "Enter ${widget.label}";
    
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding:  const EdgeInsets.only(left: 10, top: 5),
        //   child: Text(
        //     widget.label,
        //     style: smallWhite.copyWith(color: Colors.white.withOpacity(0.8)))
        // ),
        const SizedBox(
            height: 8.0), // Space between the label and the TextField
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            keyboardType: widget.keyboardType,
            
            controller: widget.controller,
            autovalidateMode: AutovalidateMode.disabled,
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter ${widget.label}";
               
              }
              return null;
            },

            obscureText: widget.isPassword
                ? widget.hidePassword
                : widget.isPassword, // Hide text for password fields
            decoration: InputDecoration(
              errorStyle: const TextStyle(
                fontSize: 11,height: 0
              ),
          
              filled: true,
              fillColor: Colors.transparent,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              labelText: widget.hintText,
              labelStyle: TextStyle(
                fontSize: 12,
                color: hintColor,
                
              ),
              hintStyle:  TextStyle(
                fontSize: 12,
                color: hintColor,
                
              ),
              border: const UnderlineInputBorder(),
               
              
              suffixIcon: widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          widget.hidePassword = !widget.hidePassword;
                        });
                      },
                      icon: Icon(widget.hidePassword
                          ? Icons.visibility_off
                          : Icons.visibility))
                  : null,
              enabledBorder: const UnderlineInputBorder(
                // Border when the field is enabled
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(
                    color: Colors.grey), // Change to your desired color
              ),
              focusedBorder: const UnderlineInputBorder(
                // Border when the field is focused
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(
                    color: Colors.blue),
                     // Change to your desired color
              ),
            ),
          ),
        ),
        
      ],
    );
  }
}

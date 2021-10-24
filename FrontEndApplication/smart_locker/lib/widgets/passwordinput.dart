import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({
    Key? key,
    required this.passwordController,
    required this.hint,
  }) : super(key: key);
  final TextEditingController passwordController;
  final String hint;
  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.width * 0.13,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 10.0,
            color: Colors.black.withOpacity(0.5),
          ),
        ],
      ),
      child: TextFormField(
        controller: widget.passwordController,
        keyboardType: TextInputType.text,
        obscureText: _isHidden,
        validator: (String? newValue) {
          if (newValue!.length > 25) {
            return "error1";
          }
          if (!RegExp(
                  r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$")
              .hasMatch(newValue)) {
            return "Minimum 8 characters, at least one letter, one number and one special character";
          }
          return null;
        },
        style: TextStyle(fontSize: 20.0, color: Colors.black),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, -10.0, 20.0, 15.0),
          hintText: widget.hint,
          suffix: InkWell(
            onTap: _togglePasswordView,
            child: Icon(
              _isHidden ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 32.0),
            borderRadius: BorderRadius.circular(20.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 32.0),
            borderRadius: BorderRadius.circular(20.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 32.0),
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}

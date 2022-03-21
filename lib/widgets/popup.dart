import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> showPopup(BuildContext context, String title, String message) async {

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: 15
          ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                message,
                style: GoogleFonts.montserratAlternates(
                  color: Colors.black,
                  fontSize: 20
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text('OK'),
                onPressed: ()  {
                },
              )
            ],
          ),
        ],
      );
    },
  );
}
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

InputDecoration AppInputStyle(label){
  return InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(),
    labelText: label,




  );
}

ButtonStyle AppButtonStyle(){

  return ElevatedButton.styleFrom(
      padding: EdgeInsets.all(24),
      backgroundColor: Colors.green,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4))
      )
  );

}


DecoratedBox AppDropdownStyle(child){
    return DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white, border: Border.all(width:  1, color: Colors.black,),

            borderRadius: BorderRadius.circular(4),

        ),
      child: child,
    );

}


   SliverGridDelegateWithFixedCrossAxisCount  ProductGridViewStyle(){
    return SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      mainAxisSpacing: 2,
      mainAxisExtent: 250
    );
}



//   void  SuccessToast(msg){
//   Fluttertoast.showToast(
//       msg: msg,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.CENTER,
//       timeInSecForIosWeb: 1,
//       backgroundColor: Colors.green,
//       textColor: Colors.white,
//       fontSize: 16.0
//   );
// }
//
//   void ErrorToast(msg){
//   Fluttertoast.showToast(
//       msg: msg,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.CENTER,
//       timeInSecForIosWeb: 1,
//       backgroundColor: Colors.red,
//       textColor: Colors.white,
//       fontSize: 16.0
//   );
// }

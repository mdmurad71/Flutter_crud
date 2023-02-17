
import 'dart:html';

import 'package:crud/style.dart';
import 'package:flutter/material.dart';

import 'RestApi/RestClient.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>   CreateProductPageState();
}

class CreateProductPageState extends State<CreateProductPage> {

  Map<String, String> FormValues = {
    "ProductName": "",
    "ProductCode": "",
    "Img": "",
    "UnitPrice": "",
    "Qty": "",
    "TotalPrice": ""
  };


  InputOnChange(key, Textvalue) {
    setState(() {
      FormValues.update(key, (value) => Textvalue);
    });
  }


  FormOnSubmit() async{

     await ProductCreateRequest(FormValues);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("create Product"),),

      body: Stack(
        children: [
          Container(
            child: (SingleChildScrollView(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  TextFormField(onChanged: (Textvalue) {
                    InputOnChange("ProductName", Textvalue);
                  }, decoration: AppInputStyle('Product Name',)),

                  SizedBox(height: 20,),

                  TextFormField(onChanged: (Textvalue) {
                    InputOnChange("ProductCode", Textvalue);
                  },
                      decoration: AppInputStyle('Product Code',)),

                  SizedBox(height: 20,),

                  TextFormField(onChanged: (Textvalue) {
                    InputOnChange("Img", Textvalue);
                  },
                      decoration: AppInputStyle('Product Image',)),

                  SizedBox(height: 20,),

                  TextFormField(onChanged: (Textvalue) {
                    InputOnChange("UnitPrice", Textvalue);
                  },
                      decoration: AppInputStyle('Unit Price',)),
                  SizedBox(height: 20,),

                  TextFormField(onChanged: (Textvalue) {
                    InputOnChange("TotalPrice", Textvalue);
                  },
                      decoration: AppInputStyle('Total Price',)),
                  SizedBox(height: 20,),

                  AppDropdownStyle(

                    DropdownButton(
                      value: FormValues['Qty'],

                      items: [
                        DropdownMenuItem(child: Text("select qty"), value: "",),
                        DropdownMenuItem(child: Text("1 pcs"), value: "1 pcs",),
                        DropdownMenuItem(child: Text("2 pcs"), value: "2 pcs",),
                        DropdownMenuItem(child: Text("3 pcs"), value: "3 pcs",),
                        DropdownMenuItem(child: Text("4 pcs"), value: "4 pcs",),

                      ],
                      onChanged: (Textvalue) {
                        InputOnChange("Qty", Textvalue);
                      },
                      underline: Container(),
                      isExpanded: true,

                    ),

                  ),
                  SizedBox(height: 20,),

                  Container(
                    width: double.infinity,
                    child: ElevatedButton(

                      style: AppButtonStyle(),
                      child: Text("Add"),
                      onPressed: () {
                        FormOnSubmit();
                      },
                    ),
                  )

                ],
              ),

            )),

          )
        ],
      ),
    );
  }
}




import 'dart:html';

import 'package:crud/ProductGridView.dart';
import 'package:crud/style.dart';
import 'package:flutter/material.dart';

import 'RestApi/RestClient.dart';

class ProductUpdateView extends StatefulWidget {

  final Map ProductItem;
  const ProductUpdateView(this.ProductItem);

  @override
  State<ProductUpdateView> createState() => _ProductUpdateViewState();
}

class _ProductUpdateViewState extends State<ProductUpdateView> {

  Map<String, String> FormValues = {
    "ProductName": "",
    "ProductCode": "",
    "Img": "",
    "UnitPrice": "",
    "Qty": "",
    "TotalPrice": ""
  };

  @override
  void initState(){
    setState(() {
      FormValues.update("ProductName", (value) => widget.ProductItem['ProductName']);
      FormValues.update("ProductCode", (value) => widget.ProductItem['ProductCode']);
      FormValues.update("Img", (value) => widget.ProductItem['Img']);
      FormValues.update("UnitPrice", (value) => widget.ProductItem['UnitPrice']);
      FormValues.update("Qty", (value) => widget.ProductItem['Qty']);
      FormValues.update("TotalPrice", (value) => widget.ProductItem['TotalPrice']);

    });
  }


  InputOnChange(key, Textvalue) {
    setState(() {
      FormValues.update(key, (value) => Textvalue);
    });
  }


  FormOnSubmit() async{

    await ProductUpdateRequest(FormValues, widget.ProductItem['_id']);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>ProductGridView()), (route) => false);

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update Product"),),

      body: Stack(
        children: [
          Container(
            child: (SingleChildScrollView(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  TextFormField(
                 initialValue: FormValues['ProductName'],
                  onChanged: (Textvalue) {
                    InputOnChange("ProductName", Textvalue);
                  }, decoration: AppInputStyle('Product Name',)),

                  SizedBox(height: 20,),

                  TextFormField(
                      initialValue: FormValues['ProductCode'],

                      onChanged: (Textvalue) {

                    InputOnChange("ProductCode", Textvalue);
                  },
                      decoration: AppInputStyle('Product Code',)),

                  SizedBox(height: 20,),

                  TextFormField(
                      initialValue: FormValues['Img'],

                      onChanged: (Textvalue) {

                    InputOnChange("Img", Textvalue);
                  },
                      decoration: AppInputStyle('Product Image',)),

                  SizedBox(height: 20,),

                  TextFormField(
                      initialValue: FormValues['UnitPrice'],

                      onChanged: (Textvalue) {

                    InputOnChange("UnitPrice", Textvalue);
                  },
                      decoration: AppInputStyle('Unit Price',)),
                  SizedBox(height: 20,),

                  TextFormField(
                      initialValue: FormValues['TotalPrice'],

                      onChanged: (Textvalue) {

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
    );  }
}

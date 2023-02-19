
import 'package:crud/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'RestApi/RestClient.dart';

class ProductGridView extends StatefulWidget {
  const ProductGridView({Key? key}) : super(key: key);

  @override
  State<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {


 var ProductList= [];
 bool Loading= true;
 @override
 void initState(){
   callData();
   super.initState();
 }

 callData() async{
 Loading= true;
 var data= await GetProductData();
 setState(() {
   ProductList= data;
   print(ProductList);

   Loading= false;
 });


 }

 DeleteItem(id) async{
   showDialog(
       context: context,
        builder: (BuildContext context){
      return AlertDialog(
        title: Text('Delete !'),
        content: Text(id),
        actions: [
          OutlinedButton(onPressed: () async{
            Navigator.pop(context);

            setState(() {
              Loading = true;
            });
            await DeleteProduct(id);
            await callData();


          }, child: Text("Yes")),
          OutlinedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("No")),
        ],

      );
        }
   );
 }

 // Delete(){
 //   showDialog(
 //       context: context,
 //       builder: (BuildContext, context){
 //         return AlertDialog()
 //       }
 //   )
 // }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("product List")),
      body: Stack(
        children: [
          Container(
            child: Loading?(Center(child: CircularProgressIndicator())): RefreshIndicator(

              onRefresh: ()async{
                await callData();
              },
                child: GridView.builder(
                    gridDelegate: ProductGridViewStyle(),
                    itemCount: ProductList.length,
                    itemBuilder: (context, index){
                      return Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(child: Image.network(ProductList[index]['Img'], fit: BoxFit.fill,)),
                            Container(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(ProductList[index]['ProductName']),
                                  SizedBox(height: 7,),
                                  Text("price:"+ProductList[index]['UnitPrice']+ "BDT"),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      OutlinedButton(onPressed: (){},
                                          child: Icon(CupertinoIcons.ellipsis_vertical_circle, size: 18, color: Colors.green,)
                                      ),
                                      OutlinedButton(onPressed: (){
                                        DeleteItem(ProductList[index]['_id']);
                                      },
                                          child: Icon(CupertinoIcons.delete, size: 18, color: Colors.green,)
                                      ),
                                    ],
                                  )
                                ],


                              ),
                            )
                          ],
                        ),
                      );
                    }
                ),
            ),
          )
        ],
      ),
    );
  }
}


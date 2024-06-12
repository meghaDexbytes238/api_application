import 'package:api_application/GetApi/getapi2/product_model.dart';
import 'package:flutter/material.dart';

import 'api_integrate.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
  //  ApiIntegration().productDataFetch();
    // TODO: implement initState
    super.initState();
  }
  List<String>? images;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: FutureBuilder<ProductListMode>(
          future: ApiIntegration().productDataFetch(), 
          builder: (context, AsyncSnapshot<ProductListMode> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            else{
              return ListView.builder(

                itemBuilder: (context, index) {
                //  String images='${snapshot.data?.products?[index].images?[0]}';
                  return ListTile(
                    title: Text(snapshot.data?.products?[index].title ?? ""),
                    subtitle: Text(snapshot.data?.products?[index].description ?? ""),
                    leading: Text("${snapshot.data?.products?[index].id}"),
                    trailing:CircleAvatar(
                      child: Image.network('https://cdn.dummyjson.com/product-images/7/1.jpg'),
                        )


                    // Container(
                    // //  height: 50,width: 50,
                    //   decoration: const BoxDecoration(
                    //     color: Colors.grey,
                    //     // image: DecorationImage(
                    //     //   fit: BoxFit.cover,
                    //     //   image: Image.network(image)
                    //     //   // image: NetworkImage("${snapshot.data?[index].images?[0]}" ?? "")
                    //     // )
                    //
                    //   ),
                    //     child:Image.network(images)
                    // )
                  );
                },
                itemCount: snapshot.data?.products?.length,

              );
            }



          },
        //
      
      
      ),

    );
  }
}

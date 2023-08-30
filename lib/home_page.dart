import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/global_varaible.dart';
import 'package:shop_app/product_cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filter = const ['All','Addidas','Nike','Bata'];

 late String  selectedFilter;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedFilter = filter[0];
 }

  @override
  Widget build(BuildContext context) {
   final border = OutlineInputBorder(
     borderSide: BorderSide(
         color: Color.fromRGBO(225, 225, 225, 1)
     ),
     borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),

   );
    return Scaffold(
        body: SafeArea(
      child: Column(

        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Text(
                  'Shop\nCollection',
                 style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                     border:border,
                     enabledBorder: border,
                     focusedBorder: border,
                    ),
                ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: filter.length,
                itemBuilder: (context,index){
                  final filters = filter[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedFilter = filters;
                        });

                      },
                      child: Chip(
                        backgroundColor:selectedFilter==filters ? Theme.of(context).colorScheme.primary: Color.fromRGBO(245, 247, 249, 1),
                          side: BorderSide(
                            color: Color.fromRGBO(245, 247, 249, 1),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                          label: Text(filters,style:GoogleFonts.lato(fontWeight: FontWeight.w300,)),
                        labelStyle: TextStyle(fontSize: 18),
                       ),
                    ),
                  );
                }),
          ),
           Expanded(

             child: ListView.builder(

                 itemCount: product.length,
                 itemBuilder: (context,index){
                 final products = product[index];

                 return ProductCart(
                     title: products['title']as String,
                     price: products["price"] as double,
                     image: products['imageURL']as String,

                     //even number index checking//
                     backgroundColor:index.isEven
                         ? Color.fromRGBO(216, 240, 253, 1)
                         :Color.fromRGBO(245,247,249,1),
                 );

                 }),
           ),
        ],
      ),
    ));
  }
}

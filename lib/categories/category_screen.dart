import "package:expensemanager/categories/widgets/add_categories.dart";
import "package:expensemanager/categories/widgets/delete_categories.dart";
import "package:expensemanager/drawer_screen.dart";
import "package:flutter/material.dart";


class MyCategory extends StatefulWidget {
  const MyCategory({super.key});

  @override
  State createState() => _MyCategory();
}

class _MyCategory extends State {
  List<Map<String, String>> categories = [
    {
      "assets/Images/medicine.png": "Medicine",
    },
    {
      "assets/Images/food.png": "Food"
      },
    {
      "assets/Images/fuel.png": "Fuel"
      },
    {
      "assets/Images/shopping.png": "shopping"
      },
  ];

    //Raises bottom sheet to add categories 
    void addCategoryBottomSheet(){
      showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: true,
        context: context, 
        builder:(context) {
        //functrion that describe ui of sheet
          return addCategory(context);
        },
        );
    }



  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromRGBO(255, 255, 255, 1),
          appBar: AppBar( 
            backgroundColor: const  Color.fromRGBO(255, 255, 255, 1),
        title: const Text( "Categories",
          style: TextStyle( 
            fontSize:20,
            fontWeight: FontWeight.w500 
          ),
        ),
        actions: [ 
          IconButton(
            onPressed: (){

          },
          icon: const Icon( 
            Icons.search,
            size: 30,
          ),
          )
        ],
      ),
      drawer: MYDrawer(context),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        padding: const EdgeInsets.all(10),
        itemCount: 4,
        itemBuilder: (context, index) {
          return GestureDetector(
            onLongPress: (){
              //Delete dailog to delete the category of transaction
              showDeleteDialog(context);
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.15),
                        spreadRadius: 2,
                        blurRadius: 8),
                  ]),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      categories[index].keys.toList()[0],
                      height: 74,
                      width: 74,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                     categories[index].values.toList().first,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        label: const Text(
          "Add Category",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.black
          ),
        ),
        icon: const Icon(Icons.add_circle_rounded,
            color: Color.fromRGBO(14, 161, 125, 1), size: 33),
        onPressed: () {
          setState(() {
            addCategoryBottomSheet();
          });
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(67)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

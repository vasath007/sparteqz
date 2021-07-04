import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sparteqz/model/food_model.dart';
import 'package:sparteqz/reusuable_widgets/food_items.dart';
import 'package:sparteqz/reusuable_widgets/sliding.dart';

class HomePage extends StatefulWidget
{
  @override
  HomePageState createState() => HomePageState();
}
class HomePageState extends State<HomePage>
{
  int _selectedIndex = 0;
  int _timeIndex = 0;
  List<Timings> timeList = [Timings(index: 0, timing: "Breakfast"),
    Timings(index: 1, timing: "Lunch"),
    Timings(index: 2, timing: "Supper"),];
  List<FoodDetails> foodDetails =[
    FoodDetails(foodName: "Chicken Salad", foodOffer: "10 % off",
        foodPrice: "PKR 250", foodImg: "images/chicken_salad.jpg"),
    FoodDetails(foodName: "Egg Sandwich", foodOffer: "with fresh salad",
        foodPrice: "PKR 300", foodImg: "images/egg_sandwich.jpg"),
    FoodDetails(foodName: "Waffels Bread", foodOffer: "with strawberry",
        foodPrice: "PKR 175", foodImg: "images/waffels_bread.jpg"),
    FoodDetails(foodName: "Avocado", foodOffer: "10 % off",
        foodPrice: "PKR 420", foodImg: "images/avocado.jpg"),
  ];
  bool isClicked = false;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     appBar: AppBar(
       backgroundColor: Colors.white,
       elevation: 0.0,
       leading: IconButton(
         icon: Icon(FontAwesomeIcons.alignLeft, color: Colors.orangeAccent,),
         onPressed: (){},
       ),
       actions: [
         IconButton(
           icon: Icon(Icons.search, color: Colors.orangeAccent,),
           onPressed: (){},
         ),
       ],
     ),
      body: screenToRender(),
      bottomNavigationBar: customNavBar(),
    );
  }

  Widget customNavBar()
  {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: Row(
        children: [
          navBarItems(FontAwesomeIcons.home, 0, "Home"),
          navBarItems(FontAwesomeIcons.shoppingBasket, 1, "Cart"),
          navBarItems(FontAwesomeIcons.commentDots, 2, "Chat"),
          navBarItems(FontAwesomeIcons.bell, 3, "Notify"),
        ],
      )
    );
  }
  Widget navBarItems(IconData icon, int index, String itemName)
  {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width/4.3,
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon,
            size: 30.0,
            color:
            _selectedIndex == index? Colors.orangeAccent:Colors.white,),
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(itemName, style: TextStyle(
               color: _selectedIndex == index? Colors.orangeAccent:Colors.white,
              ),),
            )
          ],
        )
      ),
      onTap: ()
      {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }

  Widget screenToRender()
  {
    if(_selectedIndex == 0)
      return homeItems();
    else if(_selectedIndex == 1)
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(Icons.gif,
              color: Colors.black,),
          ),
        ],
      );
    else if(_selectedIndex == 2)
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(Icons.chat_outlined,
              color: Colors.black,),
          ),
        ],
      );
    else if(_selectedIndex == 3)
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(Icons.notifications,
              color: Colors.black,),
          ),
        ],
      );
  }

  Widget homeItems()
  {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerText(),
          foodTimings(),
          SliderWidget(foods: foodDetails,),
          SizedBox(height: 20.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recomended Foods", style: TextStyle(
                  color: Colors.black, fontSize: 20.0,),),
                Text("View All", style: TextStyle(color: Colors.orangeAccent),)
              ],
            ),
          ),
          SizedBox(height: 20.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: FoodItem(foodDetails: foodDetails,),
          ),
          SizedBox(height: 20.0,),
        ],
      ),
    );
  }

  Widget headerText()
  {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Delicious Foods", style: TextStyle(color: Colors.black,
           fontSize: 25.0,
           fontWeight: FontWeight.bold),),
          SizedBox(height: 5.0,),
          Text("we provide fresh and Healthy food", style: TextStyle(color: Colors.orange),),
        ],
      ),
    );
  }

   Widget foodTimings()
  {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: timeList.asMap().map((index, time) =>
            MapEntry(index,
            InkWell(
              onTap: ()
              {
                setState(() {
                  _timeIndex = index;
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: _timeIndex == index?
                      Colors.black:
                  Colors.grey[100]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(time.timing,
                   style: TextStyle(color:
                   _timeIndex == index?
                   Colors.white:
                   Colors.black),),
                ),
              ),
            ))).values.toList(),
          ),
          IconButton(icon: Icon(Icons.add_road_sharp,
          color: Colors.black,),
              onPressed: (){

              })
        ],
      ),
    );
  }
}
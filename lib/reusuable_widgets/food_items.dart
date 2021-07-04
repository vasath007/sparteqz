import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparteqz/model/food_model.dart';

class FoodItem extends StatefulWidget
{
  List<FoodDetails> foodDetails;
  FoodItem({this.foodDetails}):super();
  @override
  FoodItemState createState()=> FoodItemState();
}

class FoodItemState extends State<FoodItem>
{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: ListView.builder(
          itemCount: widget.foodDetails.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, ind)
          {
            return Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 15.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Theme.of(context).scaffoldBackgroundColor
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(widget.foodDetails[ind].foodImg),
                        radius: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(widget.foodDetails[ind].foodName, style: TextStyle(color: Colors.red[200],
                            fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(widget.foodDetails[ind].foodOffer,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 30.0),
                        child: Text(widget.foodDetails[ind].foodPrice, style: TextStyle(color: Colors.orangeAccent[100],
                            fontWeight: FontWeight.bold),),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  left: 50.0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: Icon(Icons.add, color: Colors.white,),
                  ),)
              ],
            );
          }),
    );
  }
}
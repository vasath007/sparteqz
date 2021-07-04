import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparteqz/model/food_model.dart';

class SliderWidget extends StatefulWidget
{
  List<FoodDetails> foods;
  SliderWidget({this.foods}):super();
  @override
  SliderState createState() => SliderState();
}
class SliderState extends State<SliderWidget>
{
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CarouselSlider(
            items: widget.foods.asMap().map((ind, food) =>
            MapEntry(ind,
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60.0),
                              color: Theme.of(context).scaffoldBackgroundColor
                           ),
                          child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage(food.foodImg),
                                        radius: 60,
                                       ),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 20.0, right: 70.0),
                                       child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 20.0,),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 5.0),
                                            child: Text(food.foodName, style: TextStyle(color: Colors.red[200],
                                                fontWeight: FontWeight.bold),),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 5.0),
                                            child: Text(food.foodOffer,),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 5.0, bottom: 30.0),
                                            child: Text(food.foodPrice, style: TextStyle(color: Colors.orangeAccent[100],
                                                fontWeight: FontWeight.bold),),
                                          )
                                             ],
                                          ),
                                     ),
                                       ],
                                     ),
                                 ),
                          Positioned(
                            top: 50.0,
                            right: 0.0,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20.0)
                              ),
                              child: Icon(Icons.add, color: Colors.white,),
                            ),)
                        ],
                      ),
                    ],
                  ),
                ))).values.toList(),
            options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 1.0,
              onPageChanged: _pageChanging
            ),
          ),
        new Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: map<Widget>(
              widget.foods,
                  (index, url) {
                return Container(
                  width: _current == index? 20.0:8.0,
                  height: 4.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: _current == index
                          ? Color.fromRGBO(0, 0, 0, 0.9)
                          : Color.fromRGBO(0, 0, 0, 0.4)),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
  _pageChanging(int index, CarouselPageChangedReason reason) {
    setState(() {
      _current = index;
    });
  }
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }
}
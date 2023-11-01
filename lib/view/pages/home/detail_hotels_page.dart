import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:traveloka_clone/data/added_hotels.dart';
import 'package:traveloka_clone/data/models/hotel_model.dart';
import 'package:traveloka_clone/view/widgets/grade_star_widget.dart';
import 'package:traveloka_clone/view/widgets/hotels_rating_widget.dart';
import 'package:traveloka_clone/view/widgets/label_star_widget.dart';
import 'package:traveloka_clone/view/widgets/location_distance_widget.dart';

class DetailHotelsPage extends StatelessWidget {
  final HotelModel model;
  const DetailHotelsPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 260,
            color: Colors.red,
            child: Image.asset(model.imageUrls[0], fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.name),
                SizedBox(height: 8),
                LabelNStarWidget(countStar: model.star),
                SizedBox(height: 8),
                LocationNDistance(location: model.location),
              ],
            ),
          ),
          Divider(thickness: 2, height: 16),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Ratings'),
                SizedBox(height: 8),
                HotelsRating(
                  rating: model.rating,
                  desc: 'Convinien',
                ),
              ],
            ),
          ),
          Divider(thickness: 2, height: 16),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Description'),
                SizedBox(height: 8),
                Text(model.desc),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(blurRadius: 8, spreadRadius: 1, color: Colors.blueGrey)
        ]),
        child: Container(
          height: 90,
          color: Colors.white,
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price'),
                  SizedBox(height: 4),
                  Text(
                    'Rp ${model.price}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 4),
                  Text('Inclusive of Taxes'),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  bookedHotels.add(model);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/',
                    (route) => route.isFirst,
                  );
                },
                child: Text('Purchase'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

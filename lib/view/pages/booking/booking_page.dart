import 'package:flutter/material.dart';
import 'package:traveloka_clone/data/added_hotels.dart';
import 'package:traveloka_clone/data/models/hotel_model.dart';
import 'package:traveloka_clone/view/widgets/hotels_rating_widget.dart';
import 'package:traveloka_clone/view/widgets/label_star_widget.dart';
import 'package:traveloka_clone/view/widgets/location_distance_widget.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booked Hotels'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MediaQuery.of(context).size.width,
          mainAxisExtent: 265,
          mainAxisSpacing: 16,
        ),
        itemCount: bookedHotels.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            // Navigator.pushNamed(context, '/LHPage', arguments: bookedHotels[index]);
          },
          child: GridTile(
            child: Container(
              child: Image.asset(
                listHotels[index].imageUrls[0],
                fit: BoxFit.cover,
              ),
            ),
            footer: Container(
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _title(bookedHotels[index]),
                  SizedBox(
                    height: 8,
                  ),
                  LabelNStarWidget(countStar: bookedHotels[index].star),
                  SizedBox(
                    height: 8,
                  ),
                  LocationNDistance(location: bookedHotels[index].location),
                  Divider(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(bookedHotels[index].getPrice),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row _title(HotelModel hm) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // mainAxisSize: MainAxisSize.max,
      children: [
        Text('${hm.name}'),
        HotelsRating(
          rating: hm.rating,
        )
      ],
    );
  }
}

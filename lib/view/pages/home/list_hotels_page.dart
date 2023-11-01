import 'package:flutter/material.dart';
import 'package:traveloka_clone/data/models/hotel_model.dart';
import 'package:traveloka_clone/data/models/request_booking_model.dart';
import 'package:traveloka_clone/view/widgets/hotels_rating_widget.dart';
import 'package:traveloka_clone/view/widgets/label_star_widget.dart';
import 'package:traveloka_clone/view/widgets/location_distance_widget.dart';

class ListHotelsPage extends StatelessWidget {
  final RequestBookingModel reqBook;
  const ListHotelsPage({super.key, required this.reqBook});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(fontSize: 14),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(reqBook.location ?? 'Tidak terdefinisi'),
            Text(
                '${reqBook.dateStartSring}, ${reqBook.duration} night(s) ${reqBook.gR!.rooms} room(s)'),
          ],
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MediaQuery.of(context).size.width,
          mainAxisExtent: 265,
          mainAxisSpacing: 16,
        ),
        itemCount: listHotels.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/DHPage', arguments: listHotels[index]);
          },
          child: GridTile(
            child: Container(
              child: Image.asset(listHotels[index].imageUrls[0], fit: BoxFit.cover),
            ),
            footer: Container(
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _title(listHotels[index]),
                  SizedBox(
                    height: 8,
                  ),
                  LabelNStarWidget(countStar: listHotels[index].star),
                  SizedBox(
                    height: 8,
                  ),
                  LocationNDistance(location: listHotels[index].location),
                  Divider(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(listHotels[index].getPrice),
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
      children: [
        Text('${hm.name}'),
        HotelsRating(
          rating: hm.rating,
        )
      ],
    );
  }
}

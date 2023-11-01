import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:traveloka_clone/data/image_data.dart';
import 'package:traveloka_clone/data/models/request_booking_model.dart';

List<String> city = ['Malang', 'Surabaya', 'Jakarta', 'Bandung'];

class BookingHotelsPage extends StatefulWidget {
  BookingHotelsPage({super.key});

  @override
  State<BookingHotelsPage> createState() => _BookingHotelsPageState();
}

class _BookingHotelsPageState extends State<BookingHotelsPage> {
  RequestBookingModel reqBook = RequestBookingModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomCaraousel(listData: imageData, height: 170),
          Card(
            margin: EdgeInsets.all(16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Location
                  ListTile(
                    horizontalTitleGap: 0,
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.location_on_outlined),
                    title: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: reqBook.location ?? 'Malang',
                        items: city
                            .map(
                              (e) => DropdownMenuItem<String>(
                                child: Text(e),
                                value: e,
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            reqBook.location = value;
                            print(reqBook.location);
                          });
                        },
                      ),
                    ),
                    visualDensity: VisualDensity(vertical: -4),
                  ),
                  Divider(),
                  //Time to Stay
                  ListTile(
                    onTap: () async {
                      DateTimeRange? result = await showDateRangePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 30)),
                          initialDateRange: DateTimeRange(
                              start: DateTime.now(),
                              end: DateTime.now().add(Duration(days: 1))));
                      if (result != null) {
                        setState(() {
                          reqBook.startDate = result.start;
                          reqBook.endDate = result.end;
                        });
                      }
                    },
                    horizontalTitleGap: 0,
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.calendar_month_outlined),
                    title: Text('${reqBook.dateStartSring} - ${reqBook.dateEndSring}'),
                    visualDensity: VisualDensity(vertical: -4),
                  ),
                  Divider(),
                  Text('${reqBook.duration ?? 0} night(s) stay'),

                  //Person Count
                  ListTile(
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => _addGuest(context),
                      ).then((value) {
                        setState(() {
                          reqBook.gR = value;
                        });
                      });
                    },
                    horizontalTitleGap: 0,
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.location_on_outlined),
                    title:
                        Text(reqBook.gR == null ? 'Pilih Jumlah' : reqBook.gR.toString()),
                    visualDensity: VisualDensity(vertical: -4),
                  ),
                  Divider(),

                  //Button
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/LHPage', arguments: reqBook);
                      },
                      child: Text('Search'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Dialog _addGuest(BuildContext context) {
    final GuestRoomModel gR = GuestRoomModel();
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      insetPadding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            title: Text('Add Guest & Room'),
            automaticallyImplyLeading: false,
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                CounterWidget(
                  title: 'Rooms',
                  setNumber: (value) => gR.rooms = value,
                ),
                CounterWidget(
                  title: 'Adult',
                  setNumber: (value) => gR.adult = value,
                ),
                CounterWidget(
                  title: 'Children',
                  setNumber: (value) => gR.children = value,
                ),
                ElevatedButton(
                    onPressed: () => Navigator.pop(context, gR), child: Text('Apply'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  final String title;
  final ValueSetter<int> setNumber;
  const CounterWidget({
    super.key,
    required this.title,
    required this.setNumber,
  });

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.title),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    widget.setNumber(--value);
                  });
                },
                icon: Icon(Icons.remove)),
            Text(value.toString()),
            IconButton(
                onPressed: () {
                  setState(() {
                    widget.setNumber(++value);
                  });
                },
                icon: Icon(Icons.add)),
          ],
        )
      ],
    );
  }
}

class CustomCaraousel extends StatelessWidget {
  final List<dynamic> listData;
  final double height;
  const CustomCaraousel({
    super.key,
    required this.listData,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel.builder(
      itemCount: listData.length,
      options: CarouselOptions(
        height: height,
        autoPlay: true,
        viewportFraction: 1,
        autoPlayInterval: Duration(seconds: 1),
        slideIndicator: CircularSlideIndicator(
          currentIndicatorColor: Colors.blue,
          indicatorRadius: 4,
          itemSpacing: 12,
        ),
      ),
      itemBuilder: (context, index, realIndex) => Container(
          width: double.infinity,
          color: Colors.grey,
          child: Image.asset(
            listData[index],
            fit: BoxFit.cover,
          )),
    );
  }
}

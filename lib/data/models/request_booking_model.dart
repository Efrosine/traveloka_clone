import 'package:intl/intl.dart';

class GuestRoomModel {
  int rooms = 1, adult = 1, children = 0;

  @override
  String toString() {
    return '$rooms Room(s), $adult Adult(s), $children Children(s)';
  }
}

class RequestBookingModel {
  GuestRoomModel? gR;
  String? location;
  DateTime? startDate = DateTime.now(), endDate = DateTime.now().add(Duration(days: 1));
  int? duration;
  RequestBookingModel() {
    duration = endDate!.difference(startDate!).inDays;
  }

  String get dateStartSring {
    return DateFormat('EEE, dd MMM yyyy').format(startDate!);
  }

  String get dateEndSring {
    return DateFormat('EEE, dd MMM yyyy').format(endDate!);
  }
}

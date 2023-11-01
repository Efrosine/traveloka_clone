import 'package:intl/intl.dart';
import 'package:traveloka_clone/data/image_data.dart';

class HotelModel {
  final List<String> imageUrls;
  final String name, location, desc;
  final int star;
  final double rating, price;
  String get getPrice {
    final format = NumberFormat.currency(locale: 'id_ID', decimalDigits: 0);
    return format.format(price);
  }

  HotelModel({
    required this.imageUrls,
    required this.name,
    required this.location,
    required this.desc,
    required this.star,
    required this.rating,
    required this.price,
  });
}

List<HotelModel> listHotels = [
  HotelModel(
    imageUrls: ['assets/hotel1.jpg'],
    name: "Hotel Shangri-La Malang",
    location: "Malang, Jawa Timur",
    desc:
        "Hotel bintang 5 yang terletak di pusat kota Malang, dekat dengan kawasan wisata dan kuliner.",
    star: 5,
    rating: 4.5,
    price: 1000000,
  ),
  HotelModel(
    imageUrls: ['assets/hotel2.jpg'],
    name: "The 101 Malang City Center",
    location: "Malang, Jawa Timur",
    desc:
        "Hotel bintang 4 yang terletak di dekat Stasiun Malang Kota Baru dan pusat perbelanjaan Malang Town Square.",
    star: 4,
    rating: 4.0,
    price: 800000,
  ),
  HotelModel(
    imageUrls: ['assets/hotel3.jpg'],
    name: "Grand Mercure Malang City",
    location: "Malang, Jawa Timur",
    desc:
        "Hotel bintang 4 yang terletak di dekat Mall Olympic Garden dan Stadion Gajayana.",
    star: 4,
    rating: 3.5,
    price: 700000,
  ),
  HotelModel(
    imageUrls: ['assets/hotel4.jpg'],
    name: "JW Marriott Surabaya",
    location: "Surabaya, Jawa Timur",
    desc:
        "Hotel bintang 5 yang terletak di pusat kota Surabaya, dekat dengan kawasan bisnis dan perbelanjaan.",
    star: 5,
    rating: 4.5,
    price: 1200000,
  ),
  HotelModel(
    imageUrls: ['assets/hotel5.jpg'],
    name: "Four Seasons Hotel Surabaya",
    location: "Surabaya, Jawa Timur",
    desc: "Hotel bintang 5 yang terletak di tepi pantai, dekat dengan kawasan wisata.",
    star: 5,
    rating: 4.0,
    price: 1500000,
  ),
  HotelModel(
    imageUrls: ['assets/hotel1.jpg'],
    name: "The Westin Surabaya",
    location: "Surabaya, Jawa Timur",
    desc:
        "Hotel bintang 5 yang terletak di pusat kota Surabaya, dekat dengan kawasan bisnis dan perbelanjaan.",
    star: 5,
    rating: 3.5,
    price: 1000000,
  ),
  HotelModel(
    imageUrls: ['assets/hotel1.jpg'],
    name: "The Ritz-Carlton, Jakarta, Pacific Place",
    location: "Jakarta, DKI Jakarta",
    desc:
        "Hotel bintang 5 yang terletak di pusat kota Jakarta, dekat dengan kawasan bisnis dan perbelanjaan.",
    star: 5,
    rating: 4.5,
    price: 2000000,
  ),
  HotelModel(
    imageUrls: ['assets/hotel1.jpg'],
    name: "The St. Regis Jakarta",
    location: "Jakarta, DKI Jakarta",
    desc:
        "Hotel bintang 5 yang terletak di pusat kota Jakarta, dekat dengan kawasan bisnis dan perbelanjaan.",
    star: 5,
    rating: 4.0,
    price: 2500000,
  ),
  HotelModel(
    imageUrls: ['assets/hotel1.jpg'],
    name: "Mandarin Oriental, Jakarta",
    location: "Jakarta, DKI Jakarta",
    desc:
        "Hotel bintang 5 yang terletak di pusat kota Jakarta, dekat dengan kawasan bisnis dan perbelanjaan.",
    star: 5,
    rating: 3.5,
    price: 2000000,
  ),
  HotelModel(
    imageUrls: ['assets/hotel1.jpg'],
    name: "The Trans Luxury Hotel",
    location: "Bandung, Jawa Barat",
    desc:
        "Hotel bintang 5 yang terletak di pusat kota Bandung, dekat dengan kawasan bisnis dan perbelanjaan.",
    star: 5,
    rating: 4.5,
    price: 1800000,
  ),
  HotelModel(
    imageUrls: ['assets/hotel1.jpg'],
    name: "Grand Hyatt Bandung",
    location: "Bandung, Jawa Barat",
    desc:
        "Hotel bintang 5 yang terletak di pusat kota Bandung, dekat dengan kawasan wisata.",
    star: 5,
    rating: 4.0,
    price: 1500000,
  ),
  HotelModel(
    imageUrls: ['assets/hotel1.jpg'],
    name: "Pullman Bandung Grand Central",
    location: "Bandung, Jawa Barat",
    desc:
        "Hotel bintang 4 yang terletak di pusat kota Bandung, dekat dengan kawasan bisnis dan perbelanjaan.",
    star: 4,
    rating: 4.2,
    price: 1200000,
  ),
];

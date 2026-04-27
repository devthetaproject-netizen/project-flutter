import 'package:flutter_application_user/data/models/mitra_model.dart';

class MitraData {
  static const List<MitraModel> mitras = [
    MitraModel(
      providerName: "cv.elektrik",
      serviceName: "Servis Elektronik",
      price: 0,
      priceLabel: "Rp.-",
      rating: 4.5,
      reviewCount: 23,
      imagePath: "assets/images/dummy.jpg",
      category: "Electronic",
    ),
    MitraModel(
      providerName: "Landwo Norris",
      serviceName: "Potong Rumput",
      price: 50000,
      priceLabel: "Rp 50.000/meter",
      rating: 4.2,
      reviewCount: 15,
      imagePath: "assets/images/dummy.jpg",
      category: "Gardening",
    ),
    MitraModel(
      providerName: "Clean Pro",
      serviceName: "Cleaning Service",
      price: 150000,
      priceLabel: "Rp 150.000",
      rating: 2.0,
      reviewCount: 42,
      imagePath: "assets/images/dummy.jpg",
      category: "Cleaning",
    ),
  ];
}

import 'package:flutter_application_user/data/models/mitra_model.dart';

class MitraData {
  static const List<MitraModel> mitras = [
    MitraModel(
      providerName: "cv.elektrik",
      serviceName: "Servis Elektronik",
      price: "Rp.-",
      rating: 4.5,
      reviewCount: 23,
      imagePath: "assets/images/dummy.jpg",
      category: "Electronic",
    ),
    MitraModel(
      providerName: "Landwo Norris",
      serviceName: "Potong Rumput",
      price: "Rp 50.000/meter",
      rating: 4.2,
      reviewCount: 15,
      imagePath: "assets/images/dummy.jpg",
      category: "Gardening",
    ),
    MitraModel(
      providerName: "Clean Pro",
      serviceName: "Cleaning Service",
      price: "Rp 150.000",
      rating: 2,
      reviewCount: 42,
      imagePath: "assets/images/dummy.jpg",
      category: "Cleaning",
    ),
  ];
}

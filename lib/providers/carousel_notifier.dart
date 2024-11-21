import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_ease/models/offer_model.dart';
import 'package:home_ease/views/home/widgets/offers.dart';

class CarouselNotifier extends StateNotifier<CarouselState> {
  CarouselNotifier()
      : super(CarouselState(
          currentIndex: 0,
          carouselController: CarouselSliderController(),
          offerList: offerDataList,
        ));

  void updateIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }
}

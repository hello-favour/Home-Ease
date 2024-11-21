import 'package:home_ease/gen/assets.gen.dart';

List<OfferModel> offerDataList = [
  OfferModel(
    image: Assets.images.offer1.path,
  ),
  OfferModel(
    image: Assets.images.offer2.path,
  ),
  OfferModel(
    image: Assets.images.offer3.path,
  ),
  OfferModel(
    image: Assets.images.offer4.path,
  ),
];

class OfferModel {
  String? image;

  OfferModel({
    this.image,
  });
}

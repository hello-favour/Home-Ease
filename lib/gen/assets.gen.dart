/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/arrow-left.svg
  String get arrowLeft => 'assets/icons/arrow-left.svg';

  /// File path: assets/icons/arrow-right.svg
  String get arrowRight => 'assets/icons/arrow-right.svg';

  /// File path: assets/icons/google.svg
  String get google => 'assets/icons/google.svg';

  /// File path: assets/icons/home.svg
  String get home => 'assets/icons/home.svg';

  /// File path: assets/icons/like.svg
  String get like => 'assets/icons/like.svg';

  /// File path: assets/icons/profile.svg
  String get profile => 'assets/icons/profile.svg';

  /// File path: assets/icons/shopping-cart.svg
  String get shoppingCart => 'assets/icons/shopping-cart.svg';

  /// File path: assets/icons/sofa.png
  AssetGenImage get sofa => const AssetGenImage('assets/icons/sofa.png');

  /// List of all assets
  List<dynamic> get values =>
      [arrowLeft, arrowRight, google, home, like, profile, shoppingCart, sofa];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Armchair-1.png
  AssetGenImage get armchair1 =>
      const AssetGenImage('assets/images/Armchair-1.png');

  /// File path: assets/images/Armchair.png
  AssetGenImage get armchair =>
      const AssetGenImage('assets/images/Armchair.png');

  /// File path: assets/images/cart.png
  AssetGenImage get cart => const AssetGenImage('assets/images/cart.png');

  /// File path: assets/images/cupboard-1.png
  AssetGenImage get cupboard1 =>
      const AssetGenImage('assets/images/cupboard-1.png');

  /// File path: assets/images/getstarted.png
  AssetGenImage get getstarted =>
      const AssetGenImage('assets/images/getstarted.png');

  /// File path: assets/images/image-1.png
  AssetGenImage get image1 => const AssetGenImage('assets/images/image-1.png');

  /// File path: assets/images/image-2.png
  AssetGenImage get image2 => const AssetGenImage('assets/images/image-2.png');

  /// File path: assets/images/image-3.png
  AssetGenImage get image3 => const AssetGenImage('assets/images/image-3.png');

  /// File path: assets/images/image-4.png
  AssetGenImage get image4 => const AssetGenImage('assets/images/image-4.png');

  /// File path: assets/images/image-5.png
  AssetGenImage get image5 => const AssetGenImage('assets/images/image-5.png');

  /// File path: assets/images/image-6.png
  AssetGenImage get image6 => const AssetGenImage('assets/images/image-6.png');

  /// File path: assets/images/offer-1.png
  AssetGenImage get offer1 => const AssetGenImage('assets/images/offer-1.png');

  /// File path: assets/images/offer-2.png
  AssetGenImage get offer2 => const AssetGenImage('assets/images/offer-2.png');

  /// File path: assets/images/offer-3.png
  AssetGenImage get offer3 => const AssetGenImage('assets/images/offer-3.png');

  /// File path: assets/images/offer-4.png
  AssetGenImage get offer4 => const AssetGenImage('assets/images/offer-4.png');

  /// File path: assets/images/profile.jpg
  AssetGenImage get profile => const AssetGenImage('assets/images/profile.jpg');

  /// File path: assets/images/watch-1.png
  AssetGenImage get watch1 => const AssetGenImage('assets/images/watch-1.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        armchair1,
        armchair,
        cart,
        cupboard1,
        getstarted,
        image1,
        image2,
        image3,
        image4,
        image5,
        image6,
        offer1,
        offer2,
        offer3,
        offer4,
        profile,
        watch1
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

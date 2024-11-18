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

  /// File path: assets/icons/home.svg
  String get home => 'assets/icons/home.svg';

  /// File path: assets/icons/like.svg
  String get like => 'assets/icons/like.svg';

  /// File path: assets/icons/profile.svg
  String get profile => 'assets/icons/profile.svg';

  /// File path: assets/icons/shopping-cart.svg
  String get shoppingCart => 'assets/icons/shopping-cart.svg';

  /// List of all assets
  List<String> get values =>
      [arrowLeft, arrowRight, home, like, profile, shoppingCart];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/cart.png
  AssetGenImage get cart => const AssetGenImage('assets/images/cart.png');

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

  /// List of all assets
  List<AssetGenImage> get values =>
      [cart, getstarted, image1, image2, image3, image4, image5, image6];
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

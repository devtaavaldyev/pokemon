import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pocemons_app/features/screens/widgets/star_frame.dart';
import 'package:pocemons_app/themes/app_colors.dart';
import 'package:pocemons_app/themes/text_styles.dart';

class PokemonItems extends StatelessWidget {
  const PokemonItems({super.key, required this.name, required this.image});

  final name;
  final image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 150, 0),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.itemPoints,
            ),
            height: 74,
            width: double.infinity,
            child: Text(
              name,
              style: AppTextStyles.poppins18w500,
            ),
          ),
          Positioned(
            right: 3,
            bottom: 0,
            child: CachedNetworkImage(
              imageUrl: image,
              imageBuilder: (context, imageProvider) => ClipPath(
                clipper: StarClipper(),
                child: Container(
                  color: Colors.black,
                  width: 150,
                  height: 150,
                  child: Image.network(
                    image,
                    scale: 3,
                  ),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ],
      ),
    );
  }
}

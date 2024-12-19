import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:useful_widgets/data/app_data.dart';

class DynamicCarouselTutorial extends StatefulWidget {
  const DynamicCarouselTutorial({super.key});

  @override
  State<DynamicCarouselTutorial> createState() =>
      _DynamicCarouselTutorialState();
}

class _DynamicCarouselTutorialState extends State<DynamicCarouselTutorial> {
  late CarouselSliderController _carouselController;
  int innerCurrentPage = 0;

  @override
  void initState() {
    super.initState();

    _carouselController = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dynamic Carousel Tutorial"),
      ),
      body: Center(
        child: SizedBox(
          height: height * 0.25,
          width: width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: CarouselSlider(
                  carouselController: _carouselController,
                  items: AppData.innerStyleImages
                      .map(
                        (imagePath) => Builder(
                          builder: (context) =>
                              ImageViewerHelper.show(context, url: imagePath),
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    // aspectRatio: 16 / 8,
                    autoPlay: true,
                    enableInfiniteScroll: true,
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) {
                      setState(() {
                        innerCurrentPage = index;
                      });
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: height * 0.02,
                child: Row(
                  children: List.generate(
                    AppData.innerStyleImages.length,
                    (index) {
                      bool isSelected = innerCurrentPage == index;
        
                      return GestureDetector(
                        onTap: () {
                          _carouselController.animateToPage(index);
                        },
                        child: AnimatedContainer(
                          width: isSelected ? 55 : 17,
                          margin:
                              EdgeInsets.symmetric(horizontal: isSelected ? 6 : 3),
                          height: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: isSelected ? Colors.white : Colors.grey.shade300,
                          ),
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                left: 11,
                child: CircleAvatar(
                  backgroundColor: Colors.black.withValues(alpha: 0.2),
                  child: IconButton(
                    onPressed: () {
                      _carouselController.animateToPage(innerCurrentPage - 1);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 11,
                child: CircleAvatar(
                  backgroundColor: Colors.black.withValues(alpha: 0.2),
                  child: IconButton(
                    onPressed: () {
                      _carouselController.animateToPage(innerCurrentPage + 1);
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageViewerHelper {
  ImageViewerHelper._();

  static show(
    BuildContext context, {
    required String url,
    BoxFit? fit,
    double? radius,
  }) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit ?? BoxFit.cover,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(radius ?? 8),
          image: DecorationImage(
            image: imageProvider,
            fit: fit ?? BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Container(),
      errorWidget: (context, url, error) =>
          const Icon(Icons.error_outline_outlined),
    );
  }
}

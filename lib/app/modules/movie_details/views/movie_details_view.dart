import 'package:flutter/material.dart';
import 'package:flutter_movie_application/app/data/color_consts.dart';

import 'package:get/get.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';

import '../controllers/movie_details_controller.dart';

class MovieDetailsView extends GetView<MovieDetailsController> {
  const MovieDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MovieDetailsController());
    return Scaffold(
      backgroundColor: ColorConsts.scaffoldBgColor,
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(ColorConsts.primaryColor),
              ),
            );
          } else if (controller.movieDetails.value == null) {
            return const Center(
              child: Text(
                'Failed to load movie details.',
                style: TextStyle(color: ColorConsts.primaryColor, fontSize: 18),
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 600,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/gg.jpg'),
                                // NetworkImage(controller
                                //     .movieDetails.value!.backdropPath!),
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: ColorConsts.scaffoldBgColor
                                    .withOpacity(0.9),
                              ),
                            ),
                          )
                        ],
                      ),
                      Positioned(
                        top: 40,
                        left: 12,
                        right: 12,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () => Get.back(),
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: ColorConsts.primaryColor,
                                )),
                            Flexible(
                              child: Text(
                                controller.movieDetails.value!.originalTitle,
                                style: TextStyle(
                                    color: ColorConsts.primaryColor,
                                    fontSize: 20),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: ColorConsts.scaffoldBgColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                          top: 120,
                          left: 10,
                          right: 10,
                          child: Column(
                            children: [
                              Container(
                                width: 200,
                                height: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage('assets/gg.jpg'),
                                    //NetworkImage(controller.movieDetails.value!.posterPath!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Positioned(
                        top: 450,
                        left: 25,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.zero,
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.calendar_month,
                                  color: ColorConsts.secondaryColor),
                              Text(
                                controller.movieDetails.value!.releaseDate,
                                style: TextStyle(
                                    color: ColorConsts.secondaryColor),
                              ),
                              SizedBox(width: 8),
                              SizedBox(
                                height: 25,
                                child: VerticalDivider(
                                  color: ColorConsts.secondaryColor,
                                  thickness: 2,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.timer,
                                color: ColorConsts.secondaryColor,
                              ),
                              Text('148 Minutes',
                                  style: TextStyle(
                                      color: ColorConsts.secondaryColor)),
                              SizedBox(width: 8),
                              SizedBox(
                                height: 25,
                                child: VerticalDivider(
                                  color: Colors.grey,
                                  thickness: 2,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.local_movies,
                                  color: ColorConsts.secondaryColor),
                              Text('Action',
                                  style: TextStyle(
                                      color: ColorConsts.secondaryColor)),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 60,
                        left: 155,
                        child: Container(
                          width: 90,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorConsts.scaffoldBgColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: ColorConsts.ratingColor,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                controller.movieDetails.value!.voteAverage.toString(),
                                style: TextStyle(
                                  color: ColorConsts.ratingColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          left: 70,
                          bottom: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.zero,
                            ),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    GFButton(
                                      icon: const Icon(
                                        Icons.play_arrow,
                                        color: ColorConsts.primaryColor,
                                      ),
                                      onPressed: () {},
                                      text: 'Play',
                                      shape: GFButtonShape.pills,
                                      size: 50,
                                      color: ColorConsts.ratingColor,
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 20),
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorConsts.scaffoldBgColor,
                                  ),
                                  child: const Icon(
                                      Icons.file_download_outlined,
                                      color: ColorConsts.ratingColor),
                                ),
                                const SizedBox(width: 20),
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorConsts.gnavColor,
                                  ),
                                  child: const Icon(
                                    Icons.ios_share_sharp,
                                    color: ColorConsts.featureColor,
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: ColorConsts.secondaryColor),
                              child: const Text('13+'),
                            ),
                            const SizedBox(width: 4),
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: ColorConsts.secondaryColor),
                              child: const Text('Action'),
                            ),
                            const SizedBox(width: 4),
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: ColorConsts.secondaryColor),
                              child: const Text('IMAX'),
                            ),
                            const SizedBox(width: 4),
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: ColorConsts.secondaryColor),
                              child: const Text('2 Trailers'),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: ColorConsts.secondaryColor),
                              child: const Row(
                                children: [
                                  Icon(Icons.timer),
                                  Text(' 2hr 13min'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Text(
                              'Story Line',
                              style: TextStyle(
                                  color: ColorConsts.primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: ColorConsts.scaffoldBgColor,
                          ),
                          child: Text(
                            controller.movieDetails.value!.overview,
                            //"For the first time in the cinematic history of Spider-Man, our friendly neighborhood hero's identity is revealed, bringing his Super Hero responsibilities into conflict with his normal life and putting those he cares about most at risk. More",
                            style: TextStyle(
                                color: ColorConsts.primaryColor, fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Text(
                              'Cast and Crew',
                              style: TextStyle(
                                  color: ColorConsts.primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  GFAvatar(
                                    backgroundImage:
                                        AssetImage('assets/human.jpg'),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    children: [
                                      Text(
                                        'Jhon Watts',
                                        style: TextStyle(
                                            color: ColorConsts.primaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Director',
                                        style: TextStyle(
                                          color: ColorConsts.primaryColor,
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(width: 30),
                              Row(
                                children: [
                                  GFAvatar(
                                    backgroundImage:
                                        AssetImage('assets/human.jpg'),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    children: [
                                      Text(
                                        'Chris McKenna',
                                        style: TextStyle(
                                            color: ColorConsts.primaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Writers',
                                        style: TextStyle(
                                          color: ColorConsts.primaryColor,
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(width: 30),
                              Row(
                                children: [
                                  GFAvatar(
                                    backgroundImage:
                                        AssetImage('assets/human.jpg'),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    children: [
                                      Text(
                                        'Jhon Watts',
                                        style: TextStyle(
                                            color: ColorConsts.primaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Director',
                                        style: TextStyle(
                                          color: ColorConsts.primaryColor,
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30)
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

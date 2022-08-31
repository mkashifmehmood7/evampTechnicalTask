import 'package:evamp_task_app/components/custom_image.dart';
import 'package:evamp_task_app/constants/k_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      appBar: AppBar(
        title: const Text('PROFILE'),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.sort,
            color: primaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: primaryColor,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        children: [
          const Align(
            alignment: AlignmentDirectional.center,
            child: CustomImage(
              imagePath: 'assets/images/person.png',
              height: 150,
              width: 150,
              color: secondaryColor,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'John Doe ',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: blueColor,
              fontSize: 34,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'John@gmail.com',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: blueColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            'Welcome to Demp App',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: blueColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Lorem Ipsum is simply dummy text of '
            'the printing and typesetting industry. '
            'Lorem Ipsum has been the industrys standard dummy '
            'text ever since the 1500s, when an unknown printer '
            'took a galley of type and scrambled it to make a '
            'type specimen book. It has survived not only five '
            'centuries.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: greyColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: controller.onExploreMore,
            child: const Text(
              'EXPLORE MORE',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

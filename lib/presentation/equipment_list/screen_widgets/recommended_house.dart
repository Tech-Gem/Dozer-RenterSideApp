
import 'package:Dozer/presentation/details_screen.dart/details_screen.dart';
import 'package:Dozer/presentation/equipment_list/controllers/construction_controller.dart';
import 'package:Dozer/presentation/equipment_list/screen_widgets/circle_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RecommendedHouse extends StatelessWidget {
  final ConstructionMachineController controller = Get.put(ConstructionMachineController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.h),
      height: 340,
      child: Obx(
        () {
          if (controller.status.value == Status.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.status.value == Status.error) {
            return Center(child: Text('Error loading machines. Please try again.'));
          } else {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return DetailScreen(constructionMachine: controller.recommendedList[index],);
                      },
                    ),
                  );
                },
                child: Container(
                  width: 35.h,
                  padding: EdgeInsets.all(2.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(
    controller.recommendedList[index].image,
  ),
  fit: BoxFit.cover,
)
                        ),
                      ),
                      Positioned(
                        right: 15,
                        top: 15,
                        child: CircleIconButton(
                          iconUrl: 'assets/icons/mark.svg',
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          color: Colors.white54,
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.recommendedList[index].name,
                                    style: Theme.of(context).textTheme.headline1!.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    controller.recommendedList[index].location,
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    'Renters Name: ${controller.recommendedList[index].name}',
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    'Available Amount: ${controller.recommendedList[index].quantity.toString()}',
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                           
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              itemCount: controller.recommendedList.length,
              separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 15),
            );
          }
        },
      ),
    );
  }
}

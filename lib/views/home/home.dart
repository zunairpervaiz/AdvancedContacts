import 'package:advanced_contacts/consts/all_importer.dart';
import 'package:advanced_contacts/views/details/details.dart';
import 'package:advanced_contacts/views/home/controller.dart';
import 'package:advanced_contacts/views/widgets/custom_expansion_tile.dart';
import 'package:advanced_contacts/views/widgets/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: appBG,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => AnimatedContainer(
                  height: controller.containerHeight.value,
                  duration: const Duration(milliseconds: 300),
                  child: AnimatedContainer(
                      height: controller.containerHeight.value,
                      duration: const Duration(milliseconds: 300),
                      child: Visibility(visible: controller.showHeader.value == true ? true : false, child: header())))),
              Obx(() => Visibility(visible: controller.showHeader.value == true ? true : false, child: headerDetails())),
              4.w.heightBox,
              allContacts.text.white.fontFamily("poppins").semiBold.size(20.sp).make(),
              1.w.heightBox,
              searchBar(controller: controller.searchController, context: context, homeController: controller),
              1.w.heightBox,
              Flexible(
                child: GetBuilder<HomeController>(builder: (controller) {
                  if (controller.loading.value == true) {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    );
                  } else {
                    return GroupedListView<dynamic, dynamic>(
                      floatingHeader: true,
                      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                      physics: const BouncingScrollPhysics(),
                      useStickyGroupSeparators: true,
                      elements: controller.searchController.text.isNotEmpty ? controller.searching : controller.contacts,
                      shrinkWrap: true,
                      groupBy: (element) {
                        return element.displayName.toString().substring(0, 1);
                      },
                      controller: controller.scrollController,
                      groupHeaderBuilder: (element) => CircleAvatar(
                        child: element.displayName.toString().substring(0, 1).text.make(),
                      ),
                      indexedItemBuilder: (context, element, index) => Container(
                        padding: EdgeInsets.only(top: 1.w),
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(2.w),
                              child: InkWell(
                                onTap: () {
                                  Get.to(() => Details(
                                        controller: controller,
                                        index: index,
                                      ));
                                },
                                child: CustomExpansionTile(
                                  iconColor: appContactText,
                                  backgroundColor: Colors.green,
                                  collapsedIconColor: appContactText,
                                  leading: Hero(
                                    tag: controller.contacts[index].id,
                                    child: CircleAvatar(
                                      backgroundColor: Vx.randomPrimaryColor,
                                      child: const Icon(
                                        Icons.person,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  title: "${element.displayName}".text.white.make(),
                                  subtitle: "${element.phones[0].number}".text.color(appContactText).make(),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 12.w,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 4.w,
                                    child: IconButton(onPressed: () {}, icon: Image.asset(iconCallNormal)),
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 4.w,
                                    child: IconButton(onPressed: () {}, icon: Image.asset(iconChatNormal)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

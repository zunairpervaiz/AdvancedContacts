import 'package:advanced_contacts/consts/all_importer.dart';
import 'package:advanced_contacts/views/home/controller.dart';
import 'package:advanced_contacts/views/widgets/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Details extends StatelessWidget {
  final HomeController? controller;
  // ignore: prefer_typing_uninitialized_variables
  final index;
  const Details({Key? key, this.controller, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBG,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Image.asset(iconBack)),
          ),
          actions: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              child: IconButton(onPressed: () {}, icon: Image.asset(iconEdit)),
            )
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        child: Hero(
                            tag: controller!.contacts[index].id,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Vx.randomPrimaryColor,
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(30.w)),
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 30.w,
                              ),
                            )),
                      )),
                  1.w.heightBox,
                  contactHeaderDetails(name: controller!.contacts[index].displayName, number: controller!.contacts[index].phones[0].number),
                  2.w.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      3.w.widthBox,
                      buildContactButton(icon: iconCallNormal),
                      buildContactButton(icon: iconVideoNormal),
                      buildContactButton(icon: iconChatNormal),
                      buildContactButton(icon: iconMailNormal),
                      3.w.widthBox
                    ],
                  ),
                  4.w.heightBox,
                  conversation.text.white.fontFamily("poppins").size(18.sp).make(),
                  2.w.heightBox,
                  noConversation.text.white.fontFamily("poppins").size(15.sp).makeCentered(),
                  2.w.heightBox,
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.w),
                          color: containerBg,
                        ),
                        height: 25.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Icon(
                              Icons.phone_disabled,
                              color: Colors.red,
                            ),
                            2.h.heightBox,
                            missedCall.text.color(Colors.red).fontFamily("poppins").size(15.sp).make(),
                            2.h.heightBox,
                            "4".text.white.size(15.sp).fontFamily("poppins").make(),
                          ],
                        ),
                      )),
                      2.w.widthBox,
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(2.w), color: containerBg),
                        height: 25.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Icon(
                              Icons.phone_callback,
                              color: Colors.white,
                            ),
                            2.h.heightBox,
                            incomingCall.text.white.fontFamily("poppins").size(15.sp).make(),
                            2.h.heightBox,
                            "4".text.white.size(15.sp).fontFamily("poppins").make(),
                          ],
                        ),
                      ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

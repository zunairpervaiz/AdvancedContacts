import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getContacts();
    scrollController = ScrollController();
    checkOffSet();
    super.onInit();
  }

  checkOffSet() async {
    scrollController!.addListener(() {
      var scrollValue = scrollController!.offset.round();
      if (scrollValue > 190) {
        showHeader.value = false;
        containerHeight.value = 0.0;
      } else {
        showHeader.value = true;
        containerHeight.value = 18.h;
      }
    });
  }

  var contacts = <Contact>[].obs;
  var showHeader = true.obs;
  var searchController = TextEditingController();
  var loading = false.obs;
  var containerHeight = 18.h.obs;
  var searching = [].obs;
  var showWhatsAppText = false.obs;
  var whatsAppTextController = TextEditingController();
  ScrollController? scrollController = ScrollController();

  Future getContacts() async {
    loading.value = true;
    if (await FlutterContacts.requestPermission()) {
      contacts.value = await FlutterContacts.getContacts(withProperties: true, withPhoto: true, sorted: true, withAccounts: true);
      loading.value = false;
      // containerHeight.value = 40.0;
      update();
    }
  }
}

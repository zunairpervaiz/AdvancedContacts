import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';

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
      } else {
        showHeader.value = true;
      }
    });
  }

  var contacts = <Contact>[].obs;
  var showHeader = true.obs;
  var searchController = TextEditingController();
  var loading = false.obs;
  ScrollController? scrollController = ScrollController();

  Future getContacts() async {
    loading.value = true;
    if (await FlutterContacts.requestPermission()) {
      contacts.value = await FlutterContacts.getContacts(withProperties: true, withPhoto: true, sorted: true);
      loading.value = false;
      update();
    }
  }
}

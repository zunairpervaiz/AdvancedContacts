import 'package:flutter/material.dart';
import 'package:advanced_contacts/consts/all_importer.dart';

Widget header() {
  return Stack(
    children: [
      Padding(
        padding: EdgeInsets.only(top: 3.w, bottom: 2.w),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 0.5.w),
              borderRadius: BorderRadius.circular(20.w),
            ),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 14.w,
              backgroundImage: const AssetImage(ownerImage),
            ),
          ),
        ),
      ),
      Positioned(
        top: 6.w,
        right: 29.w,
        child: Container(
          padding: EdgeInsets.all(1.w),
          decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(1.w)),
          child: owner.text.white.fontFamily("poppins").size(12.sp).make(),
        ),
      ),
      Positioned(
        top: 3.w,
        right: 2.w,
        child: IconButton(
          icon: Image.asset(iconEdit),
          onPressed: () {},
        ),
      )
    ],
  );
}

Widget headerDetails() {
  return Column(
    children: [
      ownerName.text.white.fontFamily("poppins").size(20.sp).makeCentered(),
      ownerNumber.text.white.fontFamily("poppins").size(15.sp).makeCentered(),
      ownerEmail.text.white.fontFamily("poppins").size(15.sp).makeCentered(),
    ],
  );
}

Widget contactHeaderDetails({name, number, email}) {
  return Column(
    children: [
      "$name".text.white.fontFamily("poppins").size(20.sp).makeCentered(),
      "$number".text.white.fontFamily("poppins").size(15.sp).makeCentered(),
      email.toString() == "null" ? "".text.make() : "$email".text.white.fontFamily("poppins").size(15.sp).makeCentered(),
    ],
  );
}

Widget searchBar({controller, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 4.w),
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    child: TextField(
      onChanged: (value) {},
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white, fontFamily: "poppins"),
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.white,
        ),
        isDense: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(2.w), borderSide: const BorderSide(color: Colors.white, width: 1)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(2.w), borderSide: const BorderSide(color: Colors.white, width: 1)),
        hintText: "Search...",
        hintStyle: const TextStyle(
          color: appContactText,
          fontFamily: "poppins",
        ),
      ),
    ),
  );
}

Widget buildContactButton({icon}) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(8.w)),
    child: CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 6.w,
      child: IconButton(
          onPressed: () {},
          icon: Image.asset(
            icon,
            width: 10.w,
          )),
    ),
  );
}

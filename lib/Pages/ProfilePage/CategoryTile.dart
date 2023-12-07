import 'package:expense_manager/Controller/IconPickerController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Controller/AccountController.dart';
import '../../Controller/BottomSheetController.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({super.key});

  @override
  Widget build(BuildContext context) {
    BottomSheetController bottomSheetController =
        Get.put(BottomSheetController());
    AccountCntroller accountCntroller = Get.put(AccountCntroller());
    IconPickerController iconPickerController = Get.put(IconPickerController());
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: ExpansionTile(
        collapsedBackgroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        shape: Border(),
        leading: Icon(Icons.category),
        title: Text("Category Details"),
        children: [
          Column(
              children: accountCntroller.categoryData
                  .map(
                    (e) => ListTile(
                        title: Text(e.name!),
                        leading: SvgPicture.asset(
                          e.icon!,
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                        ),
                        trailing: SizedBox(
                          width: 70,
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit,
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                              ),
                              SizedBox(width: 20),
                              Icon(
                                Icons.delete_rounded,
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                              ),
                            ],
                          ),
                        )),
                  )
                  .toList()),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () async {
                      iconPickerController.categoryIconSelector(context);
                    },
                    child: Obx(
                      () => Container(
                        child: Row(children: [
                          SvgPicture.asset(iconPickerController
                              .categorySelectedIconvalue.value),
                          Icon(Icons.arrow_drop_down)
                        ]),
                      ),
                    )),
                const SizedBox(width: 10),
                Expanded(
                    child: TextField(
                  controller: accountCntroller.category,
                  decoration: const InputDecoration(
                    filled: false,
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    hintText: "Add New Category",
                  ),
                )),
                InkWell(
                  onTap: () {
                    accountCntroller.addNewCategory();
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    padding: const EdgeInsets.all(6),
                    child: SvgPicture.asset("Assets/Icons/donw.svg"),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Controller/AccountController.dart';
import '../../Controller/BottomSheetController.dart';
import '../../Controller/IconPickerController.dart';

class PaymentTile extends StatelessWidget {
  const PaymentTile({super.key});

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
        leading: Icon(Icons.wallet),
        title: Text("Payment Mode"),
        children: [
          Obx(
            () => Column(
                children: accountCntroller.paymentModeData
                    .map(
                      (e) => ListTile(
                          title: Text(e.name!),
                          leading: SvgPicture.asset(
                            e.icon!,
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
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
                               InkWell(
                                onTap: (){
                                  accountCntroller.deletePaymentMode(e.name!);
                                },
                                child:  Icon(
                                  Icons.delete_rounded,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                ),
                               )
                              ],
                            ),
                          )),
                    )
                    .toList()),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () async {
                      iconPickerController.paymentModeIconSelector(context);
                    },
                    child: Obx(
                      () => Container(
                        child: Row(children: [
                          SvgPicture.asset(iconPickerController
                              .paymentModeSelectedIconvalue.value),
                          Icon(Icons.arrow_drop_down)
                        ]),
                      ),
                    )),
                const SizedBox(width: 10),
                Expanded(
                    child: TextField(
                  controller: accountCntroller.paymentMode,
                  decoration: const InputDecoration(
                    filled: false,
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    hintText: "Add Payment Mode",
                  ),
                )),
                InkWell(
                  onTap: () {
                    accountCntroller.addPaymentMode();
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

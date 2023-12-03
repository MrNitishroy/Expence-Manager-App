import 'package:expense_manager/Components/KeyPadButton.dart';
import 'package:expense_manager/Config/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../Controller/BottomSheetController.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    BottomSheetController bottomSheetController =
        Get.put(BottomSheetController());
    return Obx(
      () => AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(4),
        height: bottomSheetController.isFocus.value ? 280 : 611,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  ReasionSelector(),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Expense")],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("Assets/Icons/rupee.svg"),
                      SizedBox(width: 10),
                      Text(
                        "${bottomSheetController.amountValue.value}",
                        style: TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  // SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          onTap: () {
                            bottomSheetController.isFocus.value = true;
                          },
                          focusNode: bottomSheetController.focusNode,
                          textAlign: TextAlign.center,
                          onEditingComplete: () {
                            bottomSheetController.isFocus.value = false;
                            bottomSheetController.focusNode.unfocus();
                          },
                          decoration: const InputDecoration(
                            focusedBorder: InputBorder.none,
                            filled: false,
                            hintText: "Add comment...",
                          ),
                        ),
                      ),
                      bottomSheetController.isFocus.value
                          ? InkWell(
                              onTap: () {
                                bottomSheetController.isFocus.value = false;
                                bottomSheetController.focusNode.unfocus();
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                child: Center(child: Icon(Icons.done)),
                              ),
                            )
                          : SizedBox(),
                      SizedBox(width: 20),
                    ],
                  ),
                  bottomSheetController.isFocus.value
                      ? SizedBox()
                      : Column(
                          children: [
                            Row(
                              children: [
                                const Expanded(
                                  child: KeyPaddButton(
                                    keyName: '7',
                                  ),
                                ),
                                const Expanded(
                                  child: KeyPaddButton(
                                    keyName: '8',
                                  ),
                                ),
                                const Expanded(
                                  child: KeyPaddButton(
                                    keyName: '9',
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      if (bottomSheetController
                                              .amountValue.value.length >
                                          0) {
                                        bottomSheetController
                                                .amountValue.value =
                                            bottomSheetController
                                                .amountValue.value
                                                .substring(
                                                    0,
                                                    bottomSheetController
                                                            .amountValue
                                                            .value
                                                            .length -
                                                        1);
                                      }
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(2),
                                      height: 80,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xff008BEF)
                                              .withOpacity(0.2)),
                                      child: Center(
                                        child: SvgPicture.asset(
                                            "Assets/Icons/back.svg"),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        const Row(
                                          children: [
                                            Expanded(
                                              child: KeyPaddButton(
                                                keyName: '4',
                                              ),
                                            ),
                                            Expanded(
                                              child: KeyPaddButton(
                                                keyName: '5',
                                              ),
                                            ),
                                            Expanded(
                                              child: KeyPaddButton(
                                                keyName: '6',
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: KeyPaddButton(
                                                keyName: '1',
                                              ),
                                            ),
                                            Expanded(
                                              child: KeyPaddButton(
                                                keyName: '2',
                                              ),
                                            ),
                                            Expanded(
                                              child: KeyPaddButton(
                                                keyName: '3',
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: InkWell(
                                                onTap: () {
                                                  if (bottomSheetController
                                                          .amountValue
                                                          .value
                                                          .length <
                                                      7) {
                                                    bottomSheetController
                                                            .amountValue.value =
                                                        "${bottomSheetController.amountValue.value}0";
                                                  } else {}
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.all(2),
                                                  height: 80,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Color(0xff191B28)
                                                        .withOpacity(0.2),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      "0",
                                                      style: TextStyle(
                                                          fontSize: 40,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: KeyPaddButton(
                                                keyName: '.',
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(2),
                                      height: 250,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                            "Assets/Icons/donw.svg"),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row ReasionSelector() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: paymentModeColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10)),
            height: 50,
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.wallet),
                      SizedBox(width: 10),
                      Text(
                        "Cash",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_drop_down_rounded)
                ]),
          ),
        ),
        SizedBox(width: 40),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: paymentResionColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10)),
            height: 50,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.food_bank),
                      SizedBox(width: 10),
                      Text(
                        "Food",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_drop_down_rounded)
                ]),
          ),
        ),
      ],
    );
  }
}

import 'package:expense_manager/Components/KeyPadButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(4),
      height: 800,
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
                        color:
                            Theme.of(context).colorScheme.secondaryContainer),
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
                    "453",
                    style: TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              // SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          filled: false,
                          hintText: "Add comment...",
                          hintStyle: TextStyle()),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: KeyPaddButton(
                          onTap: () {},
                          keyName: '1',
                        ),
                      ),
                      Expanded(
                        child: KeyPaddButton(
                          onTap: () {},
                          keyName: '2',
                        ),
                      ),
                      Expanded(
                        child: KeyPaddButton(
                          onTap: () {},
                          keyName: '3',
                        ),
                      ),
                      Expanded(
                        child: KeyPaddButton(
                          onTap: () {},
                          keyName: '1',
                        ),
                      ),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       flex: 3,
                  //         child: Column(
                  //       children: [
                  //         Row(
                  //           children: [
                  //             Expanded(
                  //               child: KeyPaddButton(
                  //                 onTap: () {},
                  //                 keyName: '4',
                  //               ),
                  //             ),
                  //             Expanded(
                  //               child: KeyPaddButton(
                  //                 onTap: () {},
                  //                 keyName: '5',
                  //               ),
                  //             ),
                  //             Expanded(
                  //               child: KeyPaddButton(
                  //                 onTap: () {},
                  //                 keyName: '6',
                  //               ),
                  //             ),
                  //           ],
                  //         )
                  //         ,Text("data")
                  //       ],
                  //     )),
                  //     Expanded(
                  //       child: KeyPaddButton(
                  //         onTap: () {},
                  //         keyName: '1',
                  //       ),
                  //     ),
                  //   ],
                  // )

                ],
              )
            ],
          ))
        ],
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
                color: Colors.red, borderRadius: BorderRadius.circular(10)),
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
                color: Colors.red, borderRadius: BorderRadius.circular(10)),
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

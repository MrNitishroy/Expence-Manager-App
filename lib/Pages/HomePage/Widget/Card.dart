import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return     Container(
              padding: EdgeInsets.all(15),
              height: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.wallet,
                              size: 40,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "20343.00",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Slider(

                          value: 30,
                          onChanged: (e) {},
                          min: 0,
                          max: 100,
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text("0"),
                        Text("320"),
                      ],)
                      ],
                    ),

                  )
                ],
              ),
            );
  }
}
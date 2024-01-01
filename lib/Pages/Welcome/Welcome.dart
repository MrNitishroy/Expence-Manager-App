import 'package:expense_manager/Controller/DbController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Controller/AuthController.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: 0);
    // DbController dbController = Get.put(DbController());
      AuthController authController = Get.put(AuthController());
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  SvgPicture.asset(
                    "Assets/Icons/logo.svg",
                    width: 300,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.all(30),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Track Expenses",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Take proactive steps to save your hard-earned money, and through diligent financial planning, pave the way for a brighter and more secure future for yourself.",
                         textAlign: TextAlign.center
                         , style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: ()
                          {
                            pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                          
                          }
                          ,
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "NEXT",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
         Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  SvgPicture.asset(
                    "Assets/Icons/logo.svg",
                    width: 300,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.all(30),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Auto Read SMS",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Auto Read SMS means your device automatically reads incoming text messages for convenience, especially in hands-free or accessibility situations",
                         textAlign: TextAlign.center
                         , style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                        onTap: ()
                          {
                            pageController.animateToPage(2, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                          
                          },
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "NEXT",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  SvgPicture.asset(
                    "Assets/Icons/logo.svg",
                    width: 300,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.all(30),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Share with Frinds",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Establishing financial transparency and fostering collaborative financial management, share detailed information about your expenditures with friends. ",
                         textAlign: TextAlign.center
                         , style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: (){
                            Get.offAllNamed("/authPage");
                          },
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "START",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


  import 'package:expense_manager/Controller/GroupController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> DeleteDialogBox(BuildContext context, GroupController groupController,String id) {
  
    return Get.defaultDialog(
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                        title: "Delete Group",
                        content: Column(
                          children: [
                            Text(
                              "Are you sure you want to delete this group? you can't undo this action.",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            // SizedBox(height: 20),
                          ],
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text("CANCLE"),
                                ),
                              ),
                              SizedBox(width: 20),
                              InkWell(
                                onTap: () {
                                  groupController.deleteGroup(id);
                                  Get.back();
                                  Get.back();
                                },
                                child: Container(
                                  padding: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Row(
                                    children: [
                                      Text("CANCLE"),
                                      SizedBox(width: 10),
                                      Icon(Icons.delete),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ]);
  }


import 'package:flutter/material.dart';

class UpcommingFuture extends StatelessWidget {
  const UpcommingFuture({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upcomming Future"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
                // height: 200,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "1.",
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Auto Read SMS and add transaction",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                "This feature is comming soon.",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Image.network(
                              "https://blogger.googleusercontent.com/img/a/AVvXsEigXOdAPIecWKReMslGxOR7SlNjX_YGB0HAaOLdfBdMOQfZw2NgWGqKOQwmiM0zOTmLROxfyEA70d1hLT3ijzFOo3PCZN4aI2cOV_7oxgXgj7VXl7oZZ3J17wexLzWBG6zThUylNvub59wnq97ksp0UsohaBgpYAgpaTOLONE80ocO0ckCmLV1jt1NpM1k"),
                          SizedBox(height: 20),
                          Text(
                            "When any trasaaction is done by you, you will get a notification. You can add that transaction by clicking on that notification.",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(height: 20),
                          Image.network(
                              "https://blogger.googleusercontent.com/img/a/AVvXsEjlbjBH4rzgQ4dpqjsXbePBmMSu08RFpnkAhSB6cXcl8XiGRtkGYDHPAim5H3y8bbH3zlSOJrWH1M4t-mhZyA-yB-hcl2MMf1YrHDlbIlURrpgB2mO-FlEvZbq46KA76JVNaG2bytMRkxH0Hc4V7Ely2iwPkVUG88uaApeJkzSFPvX7KIc2P-APyyCzAfU"),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                )),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                "We dont read all your SMS. We only read SMS from bank and add transaction. and we dont store your SMS in our database.",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.red),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

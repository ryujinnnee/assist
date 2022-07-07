
import 'package:flutter/material.dart';
import 'package:chat/res/services.dart';
import 'person.dart';
import 'person_card.dart';

class MainPageRes extends StatefulWidget {
  const MainPageRes({Key? key}) : super(key: key);

  @override
  State<MainPageRes> createState() => _MainPageResState();
}

class _MainPageResState extends State<MainPageRes> {
  Person? person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dio Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              person != null
                  ? PersonCard(person: person!)
                  : const Text('no data'),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                    onPressed: () async {
                      Person? result = await Services.getById(2);
                      if (result != null) {
                        setState(() {
                          person = result;
                        });
                      }

                    },
                    child: const Text('GET')),
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                    onPressed: () async {
                      Person? result = await Services.createUser(
                          'kim', 'Dahyun', 'dahyun@df.c');
                      if (result != null) {
                        setState(() {
                          person = result;
                        });
                      }
                    }, 
                    child: const Text('POST')),
              )
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:file_picker/file_picker.dart';

class AddTicketPage extends StatefulWidget {
  @override
  _AddTicketPageState createState() => _AddTicketPageState();
}

class _AddTicketPageState extends State<AddTicketPage> {
  final subjectController = TextEditingController();
  final emailController = TextEditingController();
  final descriptionController = TextEditingController();
  String selectedUint = 'select unit';
  bool isOpen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    controller: subjectController,
                    decoration: InputDecoration(
                        hintText: 'subject', border: OutlineInputBorder()),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: 'Email', border: OutlineInputBorder()),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(4)),
                  child: ExpansionTile(
                    key: GlobalKey(),
                    title: Text(selectedUint),
                    children: [
                      ListTile(
                        title: Text('Unit 1'),
                        onTap: () {
                          setState(() {
                            selectedUint = 'Unit 1';
                            isOpen = false;
                          });
                        },
                      ),
                      ListTile(
                        title: Text('Unit 2'),
                        onTap: () {
                          setState(() {
                            selectedUint = 'Unit 2';
                            isOpen = false;
                          });
                        },
                      ),
                      ListTile(
                        title: Text('Unit 3'),
                        onTap: () {
                          setState(() {
                            selectedUint = 'Unit 3';
                            isOpen = false;
                          });
                        },
                      ),
                      ListTile(
                        title: Text('Unit 4'),
                        onTap: () {
                          setState(() {
                            selectedUint = 'Unit 4';
                            isOpen = false;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    minLines: 5,
                    maxLines: 10,
                    controller: descriptionController,
                    decoration: InputDecoration(
                        hintText: 'Description', border: OutlineInputBorder()),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: 105,
                  decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.blue,
                      onTap: () async {
                        try {
                          await FilePicker.platform
                              .pickFiles(type: FileType.any);
                        } catch (e) {
                          print(e.toString());
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.attach_file,
                              size: 25,
                            ),
                            Text('attach file'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25, top: 40),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Container(
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.green[200],
                        borderRadius: BorderRadius.circular(10)),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.green,
                        child: Center(
                          child: Text('Send'),
                        ),
                        onTap: () {},
                      ),
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

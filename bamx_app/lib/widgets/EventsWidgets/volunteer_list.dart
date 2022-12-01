import 'package:flutter/material.dart';

import '../../models/registeredUser.dart';

import '../../endpoints/events_api.dart';

class VolunteerList extends StatefulWidget {
  final String id;
  const VolunteerList(this.id, {super.key});

  @override
  State<VolunteerList> createState() => _VolunteerListState();
}

class _VolunteerListState extends State<VolunteerList> {
  List<Registereduser> _volunteers = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    List<Registereduser> newList = await getRegisteredUsers(widget.id);
    setState(() {
      _volunteers = newList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.red,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.person,
                  size: 40,
                ),
                Text(
                  'Voluntarios',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 400,
            child: ListView.builder(
              itemBuilder: ((context, index) {
                return Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(_volunteers[index].imageP),
                              radius: 25,
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Text(_volunteers[index].name),
                                const Text(" "),
                                Text(_volunteers[index].lastName),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
              itemCount: _volunteers.length,
            ),
          ),
        ],
      ),
    );
  }
}

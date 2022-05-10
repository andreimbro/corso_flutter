import 'package:flutter/material.dart';
import 'package:social/api/api_users.dart';

import '../../../models/user.dart';

class ListProfDett extends StatefulWidget {
  final User user;
  final String? idLogUser;
  const ListProfDett(this.user, {this.idLogUser, Key? key}) : super(key: key);

  @override
  State<ListProfDett> createState() => _ListProfDettState();
}

class _ListProfDettState extends State<ListProfDett> {
  late bool isExpanded;
  String? _gender;

  @override
  void initState() {
    isExpanded = false;
    _gender = widget.user.gender;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool exapand) {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              leading: const Icon(
                Icons.person,
              ),
              title: Text("${widget.user.firstName}\t${widget.user.lastName}"),
            );
          },
          body: Column(
            children: [
              ListTile(
                leading: const Icon(
                  Icons.mail,
                ),
                title: Text(widget.user.email ?? "not found"),
              ),
              ListTile(
                leading: const Icon(
                  Icons.gps_fixed,
                ),
                title: Text(
                    "${widget.user.location?.city},\t${widget.user.location?.country}"),
              ),
              (widget.idLogUser == widget.user.id)
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            _gender == "female" ? Icons.girl : Icons.boy,
                            color: Colors.grey,
                            size: 38,
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                icon:
                                    const Icon(Icons.app_registration_outlined),
                                isDense: true,
                                value: _gender,
                                items: const [
                                  DropdownMenuItem(
                                    value: "male",
                                    child: Text('Male'),
                                  ),
                                  DropdownMenuItem(
                                    value: "female",
                                    child: Text('Female'),
                                  )
                                ],
                                onChanged: (item) async {
                                  setState(() {
                                    _gender = item;
                                  });

                                  await ApiUser.modUser(
                                      User(
                                          firstName: widget.user.firstName,
                                          lastName: widget.user.lastName,
                                          gender: item),
                                      widget.idLogUser ?? "");
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListTile(
                      leading: Icon(
                        widget.user.gender == "female" ? Icons.girl : Icons.boy,
                      ),
                      title: Text(widget.user.gender ?? "not found"),
                    ),
            ],
          ),
          isExpanded: isExpanded,
        ),
      ],
    );
  }
}

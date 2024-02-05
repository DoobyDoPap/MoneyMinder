// ignore_for_file: unused_field

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Split Bills',
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.blueAccent),
      ),
      home: SplitBills_Page(),
    );
  }
}

class SplitBills_Page extends StatefulWidget {
  @override
  _SplitBillsPageState createState() => _SplitBillsPageState();
}

class _SplitBillsPageState extends State<SplitBills_Page> {
  TextEditingController _groupNameController = TextEditingController();
  TextEditingController _numberOfUsersController = TextEditingController();
  TextEditingController _memberNameController = TextEditingController();

  String _groupName = '';
  int _numberOfUsers = 1;
  List<String> _groupMembers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Split Bills'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.blueGrey[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Group Details:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _groupNameController,
              decoration: InputDecoration(
                hintText: 'Enter group name',
                labelText: 'Group Name',
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _numberOfUsersController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter number of users',
                labelText: 'Number of Users',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _createGroup,
              child: Text('Create Group'),
            ),
            SizedBox(height: 16),
            _groupMembers.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Group Members:',
                        style: TextStyle(fontSize: 18),
                      ),
                      TextField(
                        controller: _memberNameController,
                        decoration: InputDecoration(
                          hintText: 'Enter member name',
                          labelText: 'Member Name',
                        ),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: _addMember,
                        child: Text('Add Member'),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Group Members:',
                        style: TextStyle(fontSize: 18),
                      ),
                      Column(
                        children: _groupMembers
                            .map((member) => Text(member))
                            .toList(),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  void _createGroup() {
    setState(() {
      _groupName = _groupNameController.text;
      _numberOfUsers = int.tryParse(_numberOfUsersController.text) ?? 1;
      _groupMembers.clear(); // Clear existing members when creating a new group
    });
  }

  void _addMember() {
    setState(() {
      String memberName = _memberNameController.text;
      if (memberName.isNotEmpty) {
        _groupMembers.add(memberName);
        _memberNameController
            .clear(); // Clear the input field after adding a member
      }
    });
  }
}

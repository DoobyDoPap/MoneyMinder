import 'package:flutter/material.dart';

class Group {
  final String name;
  final List<Member> members;

  Group({required this.name, required this.members});
}

class Member {
  final String name;
  double amountOwed;

  Member({required this.name, this.amountOwed = 0.0});
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Split Bills App',
      theme: ThemeData(
        buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal)
            .copyWith(secondary: Colors.deepOrange),
      ),
      home: GroupsPage(),
    );
  }
}

class GroupsPage extends StatefulWidget {
  @override
  _GroupsPageState createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  List<Group> groups = [
    Group(
      name: 'Friends Outing',
      members: [
        Member(name: 'Bisht'),
        Member(name: 'Pinto Bhai'),
        Member(name: 'Dubey'),
      ],
    ),
    Group(
      name: 'Roommates',
      members: [
        Member(name: 'Adi'),
        Member(name: 'Abhinav'),
        Member(name: 'Sahil'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Groups'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Groups',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: groups.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    child: ListTile(
                      title: Text(groups[index].name),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GroupDetailsPage(
                              group: groups[index],
                              onDeleteGroup: () {
                                _deleteGroup(index);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _showAddGroupDialog(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.deepOrange, // Change this color
              ),
              child: Text('Create Group'),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddGroupDialog(BuildContext context) {
    TextEditingController nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Create Group'),
        content: TextField(
          controller: nameController,
          decoration: InputDecoration(labelText: 'Enter Group Name'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              _addGroup(nameController.text);
              Navigator.pop(context);
            },
            child: Text('Create'),
          ),
        ],
      ),
    );
  }

  void _addGroup(String name) {
    if (name.isNotEmpty) {
      setState(() {
        groups.add(Group(name: name, members: []));
      });
    }
  }

  void _deleteGroup(int index) {
    setState(() {
      groups.removeAt(index);
    });
  }
}

class GroupDetailsPage extends StatefulWidget {
  final Group group;
  final VoidCallback onDeleteGroup;

  GroupDetailsPage({required this.group, required this.onDeleteGroup});

  @override
  _GroupDetailsPageState createState() => _GroupDetailsPageState();
}

class _GroupDetailsPageState extends State<GroupDetailsPage> {
  void _showAddFriendDialog(BuildContext context) {
    TextEditingController nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Friend'),
        content: TextField(
          controller: nameController,
          decoration: InputDecoration(labelText: 'Enter Friend\'s Name'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              _addFriend(nameController.text);
              Navigator.pop(context);
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  void _showManualSplitDialog(BuildContext context) {
    double amount = 0.0;
    List<Member> selectedFriends = [];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Split Amount Manually'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Enter Amount'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                amount = double.tryParse(value) ?? 0.0;
              },
            ),
            Wrap(
              children: widget.group.members.map((Member member) {
                return CheckboxListTile(
                  title: Text(member.name),
                  value: selectedFriends.contains(member),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value!) {
                        selectedFriends.add(member);
                      } else {
                        selectedFriends.remove(member);
                      }
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              _splitAmountManually(amount, selectedFriends);
              Navigator.pop(context);
            },
            child: Text('Split'),
          ),
        ],
      ),
    );
  }

  void _splitAmountManually(double amount, List<Member> selectedFriends) {
    if (amount <= 0 || selectedFriends.isEmpty) {
      return;
    }

    double share = amount / selectedFriends.length;
    for (Member friend in selectedFriends) {
      friend.amountOwed += share;
    }
  }

  void _addFriend(String name) {
    if (name.isNotEmpty) {
      setState(() {
        widget.group.members.add(Member(name: name));
      });
    }
  }

  void _deleteFriend(Member friend) {
    setState(() {
      widget.group.members.remove(friend);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.group.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Members',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Column(
              children: widget.group.members.map((Member member) {
                return Card(
                  elevation: 3,
                  child: ListTile(
                    title: Text(member.name),
                    subtitle: Text(
                      'Amount Owed: ₹${member.amountOwed.toStringAsFixed(2)}',
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _deleteFriend(member);
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _showAddFriendDialog(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.deepOrange, // Change this color
              ),
              child: Text('Add Friend'),
            ),
            SizedBox(height: 16),
            Text(
              'Expenses',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _showManualSplitDialog(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.deepOrange, // Change this color
              ),
              child: Text('Split Amount Manually'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                widget.onDeleteGroup();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: Text('Delete Group'),
            ),
          ],
        ),
      ),
    );
  }
}

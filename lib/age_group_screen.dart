import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AgeSelectionPage extends StatefulWidget {
  const AgeSelectionPage({super.key});

  @override
  State<AgeSelectionPage> createState() => _AgeSelectionPageState();
}

class _AgeSelectionPageState extends State<AgeSelectionPage> {
  String? _selectedAgeGroup;
  final List<String> _ageGroups = [
    '18-20',
    '21-25',
    '26-30',
    '31-35',
    '36-40',
    '41+'
  ];

  void _logout() {
    Navigator.pop(context);
  }

  void _submit() {
    if (_selectedAgeGroup != null) {
      Fluttertoast.showToast(
        msg: "You selected: $_selectedAgeGroup",
        backgroundColor: Colors.blue,
        textColor: Colors.white,
      );
    } else {
      Fluttertoast.showToast(
        msg: "Please select an age group",
        backgroundColor: Colors.orange,
        textColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffbbdefb), Color(0xffffffff)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInDown(
                  duration: const Duration(milliseconds: 800),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          'Select Your Age Group',
                          style: Theme.of(context).textTheme.headlineMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        onPressed: _logout,
                        icon: Icon(
                          Icons.logout,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        tooltip: 'Logout',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 2,
                    ),
                    itemCount: _ageGroups.length,
                    itemBuilder: (context, index) {
                      final ageGroup = _ageGroups[index];
                      return FadeIn(
                        duration: Duration(milliseconds: 800 + index * 100),
                        child: ChoiceChip(
                          label: Center(child: Text(ageGroup)),
                          selected: _selectedAgeGroup == ageGroup,
                          onSelected: (selected) {
                            setState(() {
                              _selectedAgeGroup = selected ? ageGroup : null;
                            });
                          },
                          selectedColor: Theme.of(context).colorScheme.primary,
                          backgroundColor: Colors.white,
                          labelStyle: TextStyle(
                            color: _selectedAgeGroup == ageGroup
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color: _selectedAgeGroup == ageGroup
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.grey.shade300,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: _submit,
                    icon: const Icon(Icons.check),
                    label: const Text("Submit"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

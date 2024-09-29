import 'package:flutter/material.dart';
import 'package:flutter_new/color/colors.dart';
import 'package:flutter_new/model/model.dart';
import 'package:flutter_new/provider/provider.dart';
import 'package:provider/provider.dart';
// Import the new file

class JournalScreen extends StatefulWidget {
  @override
  _JournalScreenState createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  String feeling = "Feeling Well";
  bool tookMedicine = false;
  int milesWalked = 3;
  int painLevel = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('How are you feeling?'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Feeling Well',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Center(
                child: Image.network(
                    width: 339,
                    height: 139,
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ74y4i3jx5j_-kh005DhdMGiKh7_GTm0nEhQ&s'),
              ),
              SizedBox(height: 8),
              Text(
                'Today, I\'m feeling well because I went trekking. It gave me time to reflect on the power of kindness...',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Container(
                height: 39,
                color: Colors.grey[200],
                child: Row(
                  children: [
                    Icon(Icons.local_hospital),
                    SizedBox(width: 8),
                    Text('Did you take your medicine?'),
                    Spacer(),
                    Checkbox(
                      value: tookMedicine,
                      onChanged: (value) {
                        setState(() {
                          tookMedicine = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              SizedBox(width: 8),
              Text('How many miles did you walk?'),
              SizedBox(height: 6),
              Container(
                color: Colors.grey[200],
                height: 39,
                child: Row(
                  children: [
                    Icon(Icons.directions_walk),

                    SizedBox(width: 8),
                    // Text('How are you feeling right now?'),

                    Text('$milesWalked miles'),
                  ],
                ),
              ),

              SizedBox(height: 16),
              Text('Pain Level',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Wrap(
                spacing: 10,
                children: List.generate(10, (index) {
                  // Use the color functions from ChipColors
                  Color defaultColor =
                      ChipColors.getDefaultChipColor(index + 1);
                  Color selectedColor =
                      ChipColors.getSelectedChipColor(index + 1);

                  return ChoiceChip(
                    label: Text('${index + 1}'),
                    selected: painLevel == index + 1,
                    selectedColor: selectedColor,
                    backgroundColor: defaultColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20), // Set the radius for rounded corners
                    ),
                    onSelected: (selected) {
                      setState(() {
                        painLevel = index + 1;
                      });
                    },
                    labelStyle: TextStyle(
                      color:
                          painLevel == index + 1 ? Colors.white : Colors.black,
                    ),
                  );
                }),
              ),
              SizedBox(height: 16), // Space before the button
              ElevatedButton(
                onPressed: () {
                  // Add journal entry
                  final newJournal = JournalEntry(
                    feeling: feeling,
                    message: 'Feeling good today',
                    imageUrl: 'https://via.placeholder.com/150',
                    tookMedicine: tookMedicine,
                    milesWalked: milesWalked,
                    painLevel: painLevel,
                  );

                  Provider.of<JournalProvider>(context, listen: false)
                      .addJournal(newJournal);
                  Provider.of<JournalProvider>(context, listen: false)
                      .printJournals();
                },
                child: Text(
                  'Save Journal',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.pink,
                  minimumSize: Size(double.infinity, 48),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

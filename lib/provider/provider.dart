import 'package:flutter/material.dart';
import 'package:flutter_new/model/model.dart';

class JournalProvider with ChangeNotifier {
  List<JournalEntry> _journals = [];

  List<JournalEntry> get journals => _journals;

  void addJournal(JournalEntry entry) {
    _journals.add(entry);
    notifyListeners();
  }

  void printJournals() {
    for (var journal in _journals) {
      print(
          'Feeling: ${journal.feeling}, Miles Walked: ${journal.milesWalked}, Pain Level: ${journal.painLevel}');
    }
  }
}

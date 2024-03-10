import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EntryForm extends StatefulWidget {
  const EntryForm({super.key});

  @override
  EntryFormState createState() => EntryFormState();
}

class EntryFormState extends State<EntryForm> {
  final _form = GlobalKey<FormState>();
  DateTime? _entryDate;
  DateTime? _exitDate;

  Future<void> _selectDate(BuildContext context, bool isEntryDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null)
      setState(() {
        if (isEntryDate) {
          _entryDate = picked;
        } else {
          _exitDate = picked;
        }
      });
  }

  TimeOfDay? _entryTime;
  TimeOfDay? _exitTime;

  Future<void> _selectTime(BuildContext context, bool isEntryTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null)
      setState(() {
        if (isEntryTime) {
          _entryTime = picked;
        } else {
          _exitTime = picked;
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Guest Entry'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              margin: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Form(
                          key: _form,
                          child: Column(
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.name,
                                textCapitalization: TextCapitalization.words,
                                decoration: InputDecoration(
                                  labelText: 'First Name',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your first name';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                keyboardType: TextInputType.name,
                                textCapitalization: TextCapitalization.words,
                                decoration: InputDecoration(
                                  labelText: 'Last Name',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your last name';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  labelText: 'Phone Number',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your phone number';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Number of people in your group',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter the number of people in your group';
                                  }
                                  return null;
                                },
                              ),
                              // enter tower
                              TextFormField(
                                keyboardType: TextInputType.name,
                                textCapitalization: TextCapitalization.words,
                                decoration: InputDecoration(
                                  labelText: 'Tower',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter the tower you are visiting';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                keyboardType: TextInputType.name,
                                textCapitalization: TextCapitalization.words,
                                decoration: InputDecoration(
                                  labelText: 'Flat Number',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your flat number';
                                  }
                                  return null;
                                },
                              ),
                              // entry date and exit date side by side in  a row and when clicked on it should open a date picker and calender
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: ListTile(
                                      title: Center(
                                          child: Text(
                                              'Entry Date')), // Center the title
                                      subtitle: Center(
                                          child: Text(_entryDate != null
                                              ? DateFormat('yyyy-MM-dd')
                                                  .format(_entryDate!)
                                              : 'Not selected')), // Center the subtitle
                                      onTap: () => _selectDate(context, true),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Center(
                                          child: Text(
                                              'Exit Date')), // Center the title
                                      subtitle: Center(
                                          child: Text(_exitDate != null
                                              ? DateFormat('yyyy-MM-dd')
                                                  .format(_exitDate!)
                                              : 'Not selected')), // Center the subtitle
                                      onTap: () => _selectDate(context, false),
                                    ),
                                  ),
                                ],
                              ),
                              // entry time and exit time side by side in  a row and when clicked on it should open time picker widget
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: ListTile(
                                      title: Center(child: Text('Entry Time')),
                                      subtitle: Center(
                                        child: Text(
                                            _entryTime?.format(context) ??
                                                'Not selected'),
                                      ),
                                      onTap: () => _selectTime(context, true),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Center(child: Text('Exit Time')),
                                      subtitle: Center(
                                        child: Text(
                                            _exitTime?.format(context) ??
                                                'Not selected'),
                                      ),
                                      onTap: () => _selectTime(context, false),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton.icon(
                                icon: Icon(Icons.approval),
                                label: Text('Send Approval'),
                                onPressed: () {
                                  if (_form.currentState!.validate()) {
                                    // Add your logic here for when the button is pressed
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

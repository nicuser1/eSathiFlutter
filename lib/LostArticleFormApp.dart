import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(LostArticleFormApp());
}

class LostArticleFormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lost Article Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LostArticleFormPage(),
    );
  }
}

class LostArticleFormPage extends StatefulWidget {
  @override
  _LostArticleFormPageState createState() => _LostArticleFormPageState();
}

class _LostArticleFormPageState extends State<LostArticleFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _contactInfoController = TextEditingController();
  final _stateController = TextEditingController();
  final _districtController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _articleNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dateController = TextEditingController();
  final _placeController = TextEditingController();
  final _areaController = TextEditingController();
  final _policeStationController = TextEditingController();
  final _fromDateController = TextEditingController();
  final _toDateController = TextEditingController();
  final _fromTimeController = TextEditingController();
  final _toTimeController = TextEditingController();
  final _incidentFactsController = TextEditingController();

  // Controllers for additional article details
  final _aadharNumberController = TextEditingController();
  final _placeOfIssueController = TextEditingController();
  final _bankAccountNumberController = TextEditingController();
  final _bankNameController = TextEditingController();
  final _admitCardNumberController = TextEditingController();
  final _institutionNameController = TextEditingController();
  final _airlinePNRController = TextEditingController();
  final _flightController = TextEditingController();
  final _dateOfDepartureController = TextEditingController();
  final _debitCardNumberController = TextEditingController();
  final _validityController = TextEditingController();
  final _detailOfArticleController = TextEditingController();

  String _selectedArticle = '';

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _selectTime(BuildContext context, TextEditingController controller) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        controller.text = picked.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lost Article Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              // Complainant Personal Details Section
              _buildSectionTitle('Complainant Personal Details'),
              _buildTextField(
                controller: _nameController,
                label: 'Full Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              _buildTextField(
                controller: _contactInfoController,
                label: 'Contact Information',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your contact information';
                  }
                  return null;
                },
              ),
              _buildTextField(
                controller: _stateController,
                label: 'State',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your state';
                  }
                  return null;
                },
              ),
              _buildTextField(
                controller: _districtController,
                label: 'District',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your district';
                  }
                  return null;
                },
              ),
              _buildTextField(
                controller: _mobileController,
                label: 'Mobile Number',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your mobile number';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
              ),
              _buildTextField(
                controller: _emailController,
                label: 'Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              _buildTextField(
                controller: _addressController,
                label: 'Address',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              // Article Details Section
              _buildSectionTitle('Article Details'),
              _buildDropdownField(
                value: _selectedArticle,
                label: 'Article Name',
                items: [
                  'Aadhar Card',
                  'Account Book',
                  'Admit Card',
                  'Air Ticket',
                  'ATM Card',
                  'Bag/Wallet'
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedArticle = newValue!;
                  });
                },
              ),
              _buildArticleDetailsFields(),
              _buildTextField(
                controller: _descriptionController,
                label: 'Article Description',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              // Place and Time of Occurrence Section
              _buildSectionTitle('Place and Time of Occurrence'),
              _buildTextField(
                controller: _placeController,
                label: 'Place of Occurrence',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the place of occurrence';
                  }
                  return null;
                },
              ),
              _buildTextField(
                controller: _areaController,
                label: 'Area',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the area';
                  }
                  return null;
                },
              ),
              _buildTextField(
                controller: _policeStationController,
                label: 'Police Station',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the police station';
                  }
                  return null;
                },
              ),
              _buildDateField(
                context,
                controller: _fromDateController,
                label: 'From Date',
              ),
              _buildDateField(
                context,
                controller: _toDateController,
                label: 'To Date',
              ),
              _buildTimeField(
                context,
                controller: _fromTimeController,
                label: 'From Time',
              ),
              _buildTimeField(
                context,
                controller: _toTimeController,
                label: 'To Time',
              ),
              _buildTextField(
                controller: _incidentFactsController,
                label: 'Brief Facts of Incident',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the brief facts of the incident';
                  }
                  return null;
                },
                maxLines: 3,
              ),
              SizedBox(height: 20),
              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process data
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String? Function(String?)? validator,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.blueAccent),
          ),
        ),
        validator: validator,
        keyboardType: keyboardType,
        maxLines: maxLines,
      ),
    );
  }

  Widget _buildDropdownField({
    required String value,
    required String label,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: value.isEmpty ? null : value,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.blueAccent),
          ),
        ),
        onChanged: onChanged,
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select an article name';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildArticleDetailsFields() {
    switch (_selectedArticle) {
      case 'Aadhar Card':
        return Column(
          children: [
            _buildTextField(
              controller: _aadharNumberController,
              label: 'Aadhar Number',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the Aadhar number';
                }
                return null;
              },
            ),
            _buildTextField(
              controller: _placeOfIssueController,
              label: 'Place of Issue',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the place of issue';
                }
                return null;
              },
            ),
          ],
        );
      case 'Account Book':
        return Column(
          children: [
            _buildTextField(
              controller: _bankAccountNumberController,
              label: 'Bank A/c Number',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the bank account number';
                }
                return null;
              },
            ),
            _buildTextField(
              controller: _bankNameController,
              label: 'Bank Name',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the bank name';
                }
                return null;
              },
            ),
          ],
        );
      case 'Admit Card':
        return Column(
          children: [
            _buildTextField(
              controller: _admitCardNumberController,
              label: 'Admit Card Number',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the admit card number';
                }
                return null;
              },
            ),
            _buildTextField(
              controller: _placeOfIssueController,
              label: 'Place of Issue',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the place of issue';
                }
                return null;
              },
            ),
            _buildTextField(
              controller: _institutionNameController,
              label: 'Institution Name',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the institution name';
                }
                return null;
              },
            ),
          ],
        );
      case 'Air Ticket':
        return Column(
          children: [
            _buildTextField(
              controller: _airlinePNRController,
              label: 'Airline PNR',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the airline PNR';
                }
                return null;
              },
            ),
            _buildTextField(
              controller: _flightController,
              label: 'Flight',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the flight';
                }
                return null;
              },
            ),
            _buildDateField(
              context,
              controller: _dateOfDepartureController,
              label: 'Date of Departure',
            ),
          ],
        );
      case 'ATM Card':
        return Column(
          children: [
            _buildTextField(
              controller: _bankAccountNumberController,
              label: 'Bank A/c Number',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the bank account number';
                }
                return null;
              },
            ),
            _buildTextField(
              controller: _debitCardNumberController,
              label: 'Debit Card Number',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the debit card number';
                }
                return null;
              },
            ),
            _buildTextField(
              controller: _validityController,
              label: 'Validity',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the validity';
                }
                return null;
              },
            ),
          ],
        );
      case 'Bag/Wallet':
        return Column(
          children: [
            _buildTextField(
              controller: _detailOfArticleController,
              label: 'Detail of Article',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the detail of article';
                }
                return null;
              },
            ),
          ],
        );
      default:
        return Container();
    }
  }

  Widget _buildDateField(BuildContext context, {
    required TextEditingController controller,
    required String label,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.blueAccent),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the date';
          }
          return null;
        },
        readOnly: true,
        onTap: () => _selectDate(context, controller),
      ),
    );
  }

  Widget _buildTimeField(BuildContext context, {
    required TextEditingController controller,
    required String label,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.blueAccent),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the time';
          }
          return null;
        },
        readOnly: true,
        onTap: () => _selectTime(context, controller),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _contactInfoController.dispose();
    _stateController.dispose();
    _districtController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _articleNameController.dispose();
    _descriptionController.dispose();
    _dateController.dispose();
    _placeController.dispose();
    _areaController.dispose();
    _policeStationController.dispose();
    _fromDateController.dispose();
    _toDateController.dispose();
    _fromTimeController.dispose();
    _toTimeController.dispose();
    _incidentFactsController.dispose();

    // Dispose additional article details controllers
    _aadharNumberController.dispose();
    _placeOfIssueController.dispose();
    _bankAccountNumberController.dispose();
    _bankNameController.dispose();
    _admitCardNumberController.dispose();
    _institutionNameController.dispose();
    _airlinePNRController.dispose();
    _flightController.dispose();
    _dateOfDepartureController.dispose();
    _debitCardNumberController.dispose();
    _validityController.dispose();
    _detailOfArticleController.dispose();

    super.dispose();
  }
}

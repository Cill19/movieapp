import 'package:flutter/material.dart';

class AddMovieScreen extends StatefulWidget {
  @override
  _AddMovieScreenState createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
  int ticketCount = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1A1A),
      appBar: AppBar(
        backgroundColor: Color(0xFF1A1A1A),
        elevation: 0,
        title: Text(
          'ADD MOVIE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              buildDateField(),
              SizedBox(height: 16),
              buildDropdownField('Studio'),
              SizedBox(height: 16),
              buildNumberField('Ticket', () {
                setState(() {
                  ticketCount++;
                });
              }, () {
                setState(() {
                  if (ticketCount > 0) ticketCount--;
                });
              }),
              SizedBox(height: 16),
              buildTextField('Price'),
              SizedBox(height: 16),
              buildDropdownField('Genre'),
              SizedBox(height: 16),
              buildTextField('Movie Name'),
              SizedBox(height: 16),
              buildTextField('Movie Description'),
              SizedBox(height: 16),
              buildTextField('Time'),
              SizedBox(height: 16),
              buildTextField('Duration'),
              SizedBox(height: 16),
              buildTextField('Synopsis Film'),
              SizedBox(height: 16),
              buildButtonBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDateField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Date',
        suffixIcon: Icon(Icons.calendar_today, color: Colors.grey),
        filled: true,
        fillColor: Color(0xFF2C2C2C),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintStyle: TextStyle(color: Colors.grey),
      ),
      style: TextStyle(color: Colors.white),
    );
  }

  Widget buildDropdownField(String hint) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Color(0xFF2C2C2C),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintStyle: TextStyle(color: Colors.grey),
      ),
      style: TextStyle(color: Colors.white),
      items: ['Option 1', 'Option 2', 'Option 3']
          .map((option) => DropdownMenuItem(
                value: option,
                child: Text(option),
              ))
          .toList(),
      onChanged: (value) {},
      iconEnabledColor: Colors.grey,
      dropdownColor: Color(0xFF2C2C2C),
    );
  }

  Widget buildNumberField(String hint, Function increment, Function decrement) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            readOnly: true,
            initialValue: ticketCount.toString(),
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Color(0xFF2C2C2C),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              hintStyle: TextStyle(color: Colors.grey),
            ),
            style: TextStyle(color: Colors.white),
          ),
        ),
        IconButton(
          icon: Icon(Icons.remove, color: Colors.grey),
          onPressed: () => decrement(),
        ),
        IconButton(
          icon: Icon(Icons.add, color: Colors.grey),
          onPressed: () => increment(),
        ),
      ],
    );
  }

  Widget buildTextField(String hint) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Color(0xFF2C2C2C),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintStyle: TextStyle(color: Colors.grey),
      ),
      style: TextStyle(color: Colors.white),
    );
  }

  Widget buildButtonBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF1A1A1A),
              padding: EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Delete',
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Simpan data ke database atau lakukan action lainnya
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              padding: EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Save',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}

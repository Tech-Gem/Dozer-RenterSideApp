import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Top search input with location icon button and GPS/dropdown
        Stack(
          children: [
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Search home ...',
                contentPadding: const EdgeInsets.only(left: 60),
              ),
            ),
            // GPS icon button on the left
            Positioned(
              left: 10,
              top: 4,
              child: IconButton(
                icon: Icon(Icons.location_on),
                onPressed: () {
                  // Implement GPS location retrieval here
                },
              ),
            ),
            // Dropdown on the right
            Positioned(
              right: 10,
              top: 4,
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  items: [
                    DropdownMenuItem(
                      child: Text('Location 1'),
                      value: 'Location 1',
                    ),
                    DropdownMenuItem(
                      child: Text('Location 2'),
                      value: 'Location 2',
                    ),
                    // Add more items as needed
                  ],
                  onChanged: (value) {
                    // Handle location selection here
                  },
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 10), // Add some space between search inputs

        // Two half-sized date inputs replaced with calendars
        Row(
          children: [
            Expanded(
              child: Container(
                height: 40, // Adjust the height as needed
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  readOnly: true,
                  onTap: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2101),
                    );

                    if (selectedDate != null) {
                      // Handle the selected date for Pickup Date
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Pickup Date',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 40, // Adjust the height as needed
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  readOnly: true,
                  onTap: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2101),
                    );

                    if (selectedDate != null) {
                      // Handle the selected date for Return Date
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Return Date',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 10), // Add some space between search inputs

        // Another search input for equipment name
        Stack(
          children: [
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Search equipment ...',
                contentPadding: const EdgeInsets.only(left: 60),
              ),
            ),
            // GPS icon button on the left
            Positioned(
              left: 10,
              top: 4,
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Implement GPS location retrieval here
                },
              ),
            ),
            // Dropdown on the right
            Positioned(
              right: 10,
              top: 4,
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  items: [
                    DropdownMenuItem(
                      child: Text('Dozer'),
                      value: 'Dozer',
                    ),
                    DropdownMenuItem(
                      child: Text('Excavator'),
                      value: 'Exacavator',
                    ),
                    // Add more items as needed
                  ],
                  onChanged: (value) {
                    // Handle location selection here
                  },
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 10), // Add some space between search inputs

        // Search button with primary color
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: ElevatedButton(
            onPressed: () {
              // Implement search functionality
            },
          
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor, // Primary color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Theme.of(context).primaryColor),
              ),
            ),
            child: Text('Search'),
          ),
        ),
      ],
    );
  }
}
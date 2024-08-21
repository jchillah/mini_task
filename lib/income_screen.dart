import 'package:flutter/material.dart';
import 'package:mini_task/success_screen.dart';

enum DateRange {
  last15Days,
  last30Days,
}

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({super.key});

  @override
  IncomeScreenState createState() => IncomeScreenState();
}

class IncomeScreenState extends State<IncomeScreen> {
  DateRange? _selectedRange = DateRange.last15Days;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF3E9EC8),
                Color(0x9C42A0C9),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Income',
                                style: TextStyle(color: Colors.white)),
                            Text('to Bank Account',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.settings, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // The main content of the screen
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Divider(
                height: 0,
                color: Color.fromARGB(104, 28, 84, 122),
                thickness: 5,
              ),
              Container(
                height: 130,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Color(0x9C42A0C9),
                    Color.fromARGB(156, 143, 193, 214),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
                child: const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Row(
                    children: [
                      Text(
                        'BCA',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 24,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '05/06/2016',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                  height: 330), // Space to move the rest of the content down
              Center(
                child: SizedBox(
                  width: 170,
                  child: DropdownButtonFormField<DateRange>(
                    value: _selectedRange,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    items: DateRange.values.map((DateRange range) {
                      return DropdownMenuItem<DateRange>(
                        value: range,
                        child: Text(_getTextForDateRange(range)),
                      );
                    }).toList(),
                    onChanged: (DateRange? newValue) {
                      setState(() {
                        _selectedRange = newValue;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Balance',
                      style: TextStyle(
                        color: Color.fromARGB(155, 28, 84, 122),
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Outcome',
                      style: TextStyle(
                        color: Color.fromARGB(155, 28, 84, 122),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '2512,50',
                      style: TextStyle(
                        color: Color.fromARGB(255, 28, 85, 122),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '1012,50',
                      style: TextStyle(
                        color: Color.fromARGB(255, 28, 85, 122),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Center(
                child: Container(
                  width: double.infinity,
                  height: 80,
                  color: const Color(0x9C42A0C9),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SuccessScreen(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero, // Remove default padding
                    ),
                    child: const Text(
                      'Done',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Container with USD and Additional Note fields
          Positioned(
            top: 100,
            left: 24,
            right: 24,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 121, 182, 233)
                        .withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
                child: Column(
                  children: [
                    TextField(
                      cursorColor: Color.fromARGB(155, 28, 84, 122),
                      textAlign: TextAlign.end,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'USD',
                        labelStyle: TextStyle(
                          fontSize: 32,
                          color: Color(0x9C42A0C9),
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 28, 85, 122),
                      ),
                    ),
                    Divider(),
                    TextField(
                      cursorColor: Color.fromARGB(155, 28, 84, 122),
                      decoration: InputDecoration(
                        labelText: 'Additional Note',
                        labelStyle: TextStyle(
                          fontSize: 32,
                          color: Color(0x9C42A0C9),
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 28, 85, 122),
                      ),
                    ),
                    SizedBox(height: 10),
                    DottedLine(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getTextForDateRange(DateRange range) {
    switch (range) {
      case DateRange.last15Days:
        return 'Last 15 Days';
      case DateRange.last30Days:
        return 'Last 30 Days';
    }
  }
}

class DottedLine extends StatelessWidget {
  const DottedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, 1),
      painter: _DottedLinePainter(),
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 3;

    var max = size.width;
    var dashWidth = 2;
    var dashSpace = 9;
    double startX = 0;

    while (startX < max) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

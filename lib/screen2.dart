import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  Screen2({super.key, this.args});
  final ScreenArgument? args;

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final List<ScreenArgument> listCard = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Danh sách thẻ"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/card.png'),
                  ),
                  Positioned(
                    left: 30,
                    bottom: 0,
                    child: Container(
                      height: 80,
                      width: 500,
                      child: Text(
                        widget.args?.username ?? "null",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    bottom: 0,
                    child: Container(
                      height: 40,
                      width: 500,
                      child: Text(
                        widget.args?.password ?? "null",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Card No",
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Fullname",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: const Text("Thêm"),
              ),
              Text(
                "Danh sách thẻ của Techmaster",
                textAlign: TextAlign.left,
              ),
              ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listCard.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10),
                      //child: ,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenArgument {
  final String username;
  final String password;

  ScreenArgument({required this.username, required this.password});
}

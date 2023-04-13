import 'package:flutter/material.dart';
import 'package:testflutterbasic/screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/":
            return MaterialPageRoute(
              builder: (context) => const MyHomePage(
                title: "Đăng nhập",
              ),
              settings: settings,
            );
          case "/screen2":
            return MaterialPageRoute(
              builder: (context) => Screen2(
                args: settings.arguments as ScreenArgument?,
              ),
              settings: settings,
            );
        }
        return null;
      },
      title: 'Đăng nhập1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? userNameTextError;
  String? passwordTextError;
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Image.asset('assets/techmaster_black.png'),
              TextField(
                controller: userNameController,
                onChanged: (value) {
                  if (value.contains(" ") && value.isNotEmpty) {
                    setState(() {
                      userNameTextError = "Username không được chứa dấu cách";
                    });
                  } else if (value.isNotEmpty) {
                    setState(() {
                      userNameTextError = null;
                    });
                  }
                },
                decoration: InputDecoration(
                  labelText: "username",
                  errorText: userNameTextError,
                ),
              ),
              TextField(
                controller: passwordController,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    setState(() {
                      passwordTextError = null;
                    });
                  }
                },
                decoration: InputDecoration(
                  labelText: "password",
                  errorText: passwordTextError,
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        isShowPassword = !isShowPassword;
                      });
                    },
                    child: Icon(
                      isShowPassword ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
                obscureText: !isShowPassword,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)))),
                onPressed: () {
                  if (userNameTextError != null && passwordTextError != null) {
                    setState(() {
                      userNameTextError = null;
                      passwordTextError = null;
                      print("object");
                    });
                  }
                  if (userNameController.text.toLowerCase() ==
                          "trinhquoctuan" &&
                      passwordController.text == "123456") {
                    Navigator.pushNamed(
                      context,
                      "/screen2",
                      arguments: ScreenArgument(
                        username: userNameController.text,
                        password: passwordController.text,
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Thông báo"),
                        content: const Text("Sai tài khoản hoặc mật khẩu"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              passwordController.clear();
                            },
                            child: const Text("OK"),
                          )
                        ],
                      ),
                    );
                  }
                },
                child: const Text("Đăng nhập"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

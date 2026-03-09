import 'package:flutter/material.dart';
import 'package:latihan_kuis_a/screen/movie_list_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  bool isLogedIn = false;
  void _login() {
    String username = usernameC.text;
    String password = passwordC.text;
    if (username == "Reza" && password == "030") {
      setState(() {
        isLogedIn = true;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MovieListPage(username: usernameC.text)),
      );
    } else {
      setState(() {
        isLogedIn = false;
      });
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isLogedIn ? 'Login Berhasil' : 'Login Gagal'),
        backgroundColor: isLogedIn ? Colors.green : Colors.red,
      ),
    );
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login Page",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.blue.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Welcome Back to MiniLens!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 20),

              _usernameTextField(),
              SizedBox(height: 20),

              _passwordTextField(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text("Login"),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _usernameTextField() {
    return TextField(
      controller: usernameC,
      decoration: InputDecoration(
        hintText: "Username...",
        labelText: "Username",
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _passwordTextField() {
    return TextField(
      controller: passwordC,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Password...",
        labelText: "Password",
        border: OutlineInputBorder(),
      ),
    );
  }
}

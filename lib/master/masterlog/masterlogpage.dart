import 'package:flutter/material.dart';
import 'package:projectedu/main.dart';
import 'package:projectedu/master/mastermainpage/master_main.dart';
import 'package:projectedu/starting_page/utilities/colors/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MasterLogMainPage extends StatefulWidget {
  const MasterLogMainPage({super.key});

  @override
  State<MasterLogMainPage> createState() => _MasterLogMainPageState();
}

class _MasterLogMainPageState extends State<MasterLogMainPage> {
  final _username = 'admin';
  final _password = '050799';
  bool _passwordvisiblity = true;
  final _usernamecontoller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        backgroundColor: ColorSelect.adminamber,
        title: const Center(
            child: Padding(
          padding: EdgeInsets.only(right: 50.0),
          child: Text(
            'Teacher Login',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        )),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Container(
              color: ColorSelect.adminset,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: const Text(
                        'Enter Your Username And Password',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black38,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _usernamecontoller,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.account_circle_outlined),
                        border: const OutlineInputBorder(),
                        labelText: 'Username',
                        labelStyle: TextStyle(color: ColorSelect.adminpblack),
                        hintText: 'Enter Username',
                        hintStyle: TextStyle(
                          color: ColorSelect.adspblack,
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a Username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      controller: _passwordcontroller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outline),
                        border: const OutlineInputBorder(),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: ColorSelect.adminpblack),
                        hintText: 'Enter Password',
                        hintStyle: const TextStyle(
                          color: Colors.black12,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordvisiblity = !_passwordvisiblity;
                            });
                          },
                          icon: const Icon(Icons.visibility),
                        ),
                      ),
                      obscureText: _passwordvisiblity,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a Username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: WidgetStateProperty.all<Size>(
                            const Size(250.0, 50.0)),
                        backgroundColor: WidgetStateProperty.all<Color>(
                          ColorSelect.adminamber,
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          checkLogin();
                        }
                      },
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void checkLogin() async {
    final username = _usernamecontoller.text;
    final password = _passwordcontroller.text;
    if (username == _username && password == _password) {
      final sharedprefadmin = await SharedPreferences.getInstance();
      await sharedprefadmin.setBool(adminKey, true);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => const MasterDirectionPage(),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Username or Password not match'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('ok'))
            ],
          );
        },
      );
    }
  }
}

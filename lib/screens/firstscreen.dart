import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia/controller/controllerscreen.dart';
import 'package:suitmedia/screens/secondthirdscreen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void tambahDialog() {
      showDialog(
          context: context,
          builder: (context) {
            return Consumer<ControllerScreen>(
                builder: (_, value, child) => AlertDialog(
                      insetPadding: EdgeInsets.zero,
                      title: const Text("Check"),
                      content: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                value.messageIsPalindrome.toString(),
                                style: const TextStyle(fontSize: 20),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 43, 99, 123),
                                    foregroundColor: Colors.white,
                                    fixedSize:
                                        const Size(double.infinity, 20.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  child: const Text(
                                    "Back",
                                    textAlign: TextAlign.center,
                                  )),
                            ],
                          )),
                    ));
          });
    } //================================/batas dialog ============================

    return Consumer<ControllerScreen>(builder: (context, value, child) {
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/bg1.jpg'), fit: BoxFit.cover)),
          height: double.infinity,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: Image.asset(
                        'assets/userfirst.png',
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      )),
                  const SizedBox(
                    height: 70.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 10.0),
                    height: 40.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: TextField(
                      controller: value.tampungNameS1,
                      decoration: const InputDecoration(
                          hintText: 'Name', // Optional hint text
                          border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 10.0),
                    height: 40.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: TextField(
                      controller: value.tampungPalindromeS1,
                      decoration: const InputDecoration(
                          hintText: 'Palindrome', // Optional hint text
                          border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      value.checkIsPalindrome();
                      tambahDialog();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 43, 99, 123),
                      foregroundColor: Colors.white,
                      fixedSize: const Size(double.infinity, 40.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'CHECK',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      value.setName();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SecondThirdScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 43, 99, 123),
                      foregroundColor: Colors.white,
                      fixedSize: const Size(double.infinity, 40.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'NEXT',
                        textAlign: TextAlign.center, // Center the text
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

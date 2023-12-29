import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia/controller/controllerscreen.dart';

class SecondThirdScreen extends StatelessWidget {
  const SecondThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ControllerScreen>(builder: (context, value, child) {
      value.fetchUserFromAPI();
      return Scaffold(
        appBar: AppBar(
          title: Text(
            value.isUserSelected! ? "Third Screen" : "Second Screen",
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
        ),
        body: value.isUserSelected!
            ? ListView.builder(
                itemCount: value.user.length,
                itemBuilder: (context, index) {
                  final user = value.user[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: ListTile(
                      onTap: () {
                        value.selectedUser(user);
                        value.setIsUserSelectedFalse();
                      },
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image(
                          image: NetworkImage(user.avatar.toString()),
                          width: 50,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text("${user.firstName} ${user.lastName}",
                          style: const TextStyle(fontSize: 15)),
                      subtitle: Text(user.email.toString(),
                          style: const TextStyle(fontSize: 11)),
                    ),
                  );
                })
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Welcome"),
                          Text(
                            value.name.toString(),
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Center(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      child: Text(
                        value.userSelected.toString(),
                        style: const TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold),
                      ),
                    )),
                    ElevatedButton(
                      onPressed: () {
                        value.setIsUserSelectedTrue();
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
                          'Choose a User',
                          textAlign: TextAlign.center, // Center the text
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    )
                  ],
                ),
              ),
      );
    });
  }
}

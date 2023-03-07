import 'package:flutter/material.dart';
import 'package:moovbe/pages/driver_list_page.dart';

import '../utility/delete_driver.dart';
import 'home_page.dart';
/*
class AddDriver extends StatelessWidget {
  AddDriver({super.key});
  static const routeName="/AddDriver";

  final nameController = TextEditingController();
  final licenseNoController = TextEditingController();
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          0.1 * screenHeight,
        ),
        child: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor:  Color.fromRGBO(43, 43, 43, 1),
          title: const Text(
            'Add Driver',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed(DriverList.routeName);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 25,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: 0.07 * screenWidth,
            left: 0.07 * screenWidth,
          ),
          child: SizedBox(
            height: 0.83*screenHeight,
            width: screenWidth,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 0.02 * screenHeight,
                  ),
              TextFormField(
                textAlign:TextAlign.center,

                //controller: _usernameTextEditingController,
                decoration: const InputDecoration(
                    filled:true,
                    fillColor: Color.fromARGB(255, 227, 222, 222),
                    hintText: "Enter Name",
                    // kvalue: 'admin_user',
                    // controller: usernamecontroller,

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),

                    controller: nameController,
                  ),
                  SizedBox(
                    height: 0.02 * screenHeight,
                  ),
                  TextFormField(
                    textAlign:TextAlign.center,

                    //controller: _usernameTextEditingController,
                    decoration: const InputDecoration(
                        filled:true,
                        fillColor: Color.fromARGB(255, 227, 222, 222),
                        hintText: "Enter License Number",
                        // kvalue: 'admin_user',
                        // controller: usernamecontroller,

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)))),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 50,
                    width:double.infinity,
                    child: ElevatedButton(

                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all( Color.fromRGBO(252, 21, 59, 1)),
                    ),
                    child: const Text('Save', style: TextStyle(color: Colors.white,),),
                    onPressed: (){
                  /*  if(formKey.currentState!.validate()){
                     // log('sucess');
                    }else{
                      log('not sucess');
                    }
*/
                  }, ),),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}*/

class AddDriver extends StatefulWidget {
  AddDriver({super.key});
  static const routeName="/AddDriver";
  @override
  State<AddDriver> createState() => _AddDriverState();
}

class _AddDriverState extends State<AddDriver> {
  final TextEditingController namecontroller = TextEditingController();

  final TextEditingController licensecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Driver'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(
              controller: namecontroller,
              decoration: const InputDecoration(
              hintText: 'Enter Name',
            ),),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: licensecontroller,
              decoration: const InputDecoration(
              hintText: 'Enter Licence Number',
            ),),
            const Spacer(),
            SaveButton(
                licensecontroller: licensecontroller,
                namecontroller: namecontroller)
          ],
        ),
      ),
    );
  }
}
class AddDriverButton extends StatelessWidget {
  const AddDriverButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return AddDriver();
            },
          ));
        },
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              color:  Color(0xFFFC153B), borderRadius: BorderRadius.circular(10)),
          child: const Center(
              child: Text(
                'Add Driver',
                style: TextStyle(color: Colors.white),
              )),
        ));
  }
}
class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
    required this.licensecontroller,
    required this.namecontroller,
  });

  final TextEditingController licensecontroller;
  final TextEditingController namecontroller;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          await addDriver(
              context: context,
              license: licensecontroller.text,
              name: namecontroller.text);

          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context) {
              return HomePage();
            },
          ), (route) => false);
        },
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              color:  Color(0xFFFC153B), borderRadius: BorderRadius.circular(10)),
          child: const Center(
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white),
              )),
        ));
  }
}
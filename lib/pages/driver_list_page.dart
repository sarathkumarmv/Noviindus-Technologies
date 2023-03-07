import 'package:flutter/material.dart';
import '../utility/delete_driver.dart';
import '../utility/driver_details.dart';
import 'add_driver_page.dart';
import 'home_page.dart';
/*
class DriverList extends StatelessWidget {
  const DriverList({super.key});
  static const routeName="/DriverList";
  @override
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
          backgroundColor: Color.fromRGBO(43, 43, 43, 1),
          title: const Text(
            'Driver List',
            style: TextStyle(
              color:  Colors.white,
              fontSize: 17,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed(HomePage.routeName);
            },
            icon: const Icon(
              Icons.arrow_back,
              color:  Colors.white,
              size: 25,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: 0.02 * screenWidth,
            left: 0.02 * screenWidth,
          ),
          child: SizedBox(
            height: 0.85 * screenHeight,
            width: screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                const Text(
                  '21 Drivers Found',
                  style: TextStyle(
                    color: Color.fromRGBO(107, 107, 107, 1),
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: ((context, index) => DriverListTile(
                    personName: 'Rohit Sharma',
                    personLicenseNo: 'Licn no: PJ5151961616',
                  )),
                  separatorBuilder: ((context, index) => SizedBox(
                    height: 0.02 * screenHeight,
                  )),
                  itemCount: 5,
                ),
                const Spacer(),
                SizedBox(
                  height: 50,
                  width:double.infinity,
                  child: ElevatedButton(
                    child: const Text('Add Driver',style: TextStyle(color: Colors.white)),
                    onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(AddDriver.routeName);
                    },
                    style:
                    ButtonStyle( backgroundColor:MaterialStatePropertyAll(Color.fromRGBO(252, 21, 59, 1))),
                // SizedBox(
                //   height: 0.15 * screenHeight,
                 ),

            ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
class DriverListTile extends StatelessWidget {
  DriverListTile({super.key,required this.personName,required this.personLicenseNo});

  String personName;
  String personLicenseNo;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ListTile(
      onTap: () {},
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(width: 1, color: Color.fromRGBO(42, 42, 42, 0.1),)),
      title: Text(
        //'KSRTC'
        personName,
        style: const TextStyle(
          color: Color.fromRGBO(71, 71, 71, 1),
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        //'Swift Scania P series'
        personLicenseNo,
        style: const TextStyle(
          color: Color.fromRGBO(71, 71, 71, 1),
          fontSize: 19,
        ),
      ),
      leading: CircleAvatar(
        backgroundColor:  Color.fromRGBO(42, 42, 42, 0.1),
        radius: 0.08*screenWidth,
        child: Image.asset(
          'assets/Ellipse.png',
        ),
      ),

      trailing:ElevatedButton(
              onPressed: () {

              },
              style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color.fromRGBO(252, 21, 59, 1)),
              ),
              child: const Text('Delete',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
        //  ),
    );
  }
}*/

class DriverList extends StatelessWidget {
  DriverList({super.key, required this.driverlist});
  List<DriverListApi> driverlist;
  static const routeName="/DriverList";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Driver List')),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              '${driverlist.length} Drivers Found',
              style: const TextStyle(
                  color: Colors.black26,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: driverlist.length,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemBuilder: (context, index) {
                return Container(
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.white, borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Container(
                          width: 90,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              color: Colors.black12),
                          height: double.maxFinite,
                          child: Image.asset('assets/Ellipse.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 17),
                          child: SizedBox(
                            width: 160,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  driverlist[index].name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 17),
                                ),
                                Text(
                                  'license no: ${driverlist[index].license}',
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                )
                              ],
                            ),
                          ),
                        ),
                        //  const Spacer(),
                        TextButton(
                            onPressed: () async {
                              await deleteDriver(
                                  context: context,
                                  index: index,
                                  driverlist: driverlist);
                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return HomePage();
                                    },
                                  ), (route) => false);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color:  Color(0xFFFC153B),
                                  borderRadius: BorderRadius.circular(7)),
                              child: const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ))
                      ],
                    ));
              },
            ),
          ),
          const AddDriverButton()
        ]),
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
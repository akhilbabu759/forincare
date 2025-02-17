import 'package:flutter/material.dart';
import 'package:fourincare/aboutus/view/aboutus.dart';
import 'package:fourincare/account/view/account.dart';
import 'package:fourincare/appointment/view/appointment.dart';
import 'package:fourincare/coustmercare/view/cousmercare.dart';
import 'package:fourincare/detail_book/view/detail_book.dart';
import 'package:fourincare/home/model/text_model.dart';
import 'package:fourincare/person_select/person-select.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int checkindex = 0;
  List<String> servnameCheck(int index) {
    if (index == 0) {
      List<String> data = [];
      data.addAll(TextModel().assiserviceName);
      data.addAll(TextModel().careserviceName);
      data.addAll(TextModel().houseserviceName);
      return data;
    } else if (index == 1) {
      return TextModel().assiserviceName;
    } else if (index == 2) {
      return TextModel().careserviceName;
    } else {
      return TextModel().houseserviceName;
    }
  }

  List<String> servDscCheck(int index) {
    if (index == 0) {
      List<String> data = [];
      data.addAll(TextModel().assiserviceDesc);
      data.addAll(TextModel().careserviceDesc);
      data.addAll(TextModel().houseserviceDesc);
      return data;
    } else if (index == 1) {
      return TextModel().assiserviceDesc;
    } else if (index == 2) {
      return TextModel().careserviceDesc;
    } else {
      return TextModel().houseserviceDesc;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> catString = ['Assistance', 'Care', 'Househelp'];

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            child: Icon(Icons.menu)),
        title: Text(
          '4 InCare',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      key: _scaffoldKey,
      drawer: Drawer(
          shadowColor: const Color.fromARGB(230, 126, 237, 180),
          surfaceTintColor: const Color.fromARGB(218, 155, 197, 219),
          backgroundColor: const Color.fromARGB(252, 55, 86, 117),
          child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                    Lottie.network(
                        'https://lottie.host/90fdcb2a-f335-4d9f-8558-ffeb7a580c7c/rXsPOGcdno.json'),
                    // Image.network(
                    //     'https://static.vecteezy.com/system/resources/thumbnails/007/117/231/small/home-repair-service-group-of-construction-engineers-with-building-equipment-tools-work-at-house-repairing-carpenter-repairman-builder-master-renovation-apartment-cartoon-flat-illustration-vector.jpg'),

                    SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(AccountDetailsPage());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.account_circle,
                            color: Colors.white,
                            size: 30,
                          ),
                          Text(
                            'Account',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(AppointmentListPage());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                            size: 30,
                          ),
                          Text(
                            'Appointment',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(AboutUsPage());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.medical_information,
                            color: Colors.white,
                            size: 30,
                          ),
                          Text(
                            'about Us',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(CustomerCarePage());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.contact_support,
                            color: Colors.white,
                            size: 30,
                          ),
                          Text(
                            'Coustmercare',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Logout'),
                  ])))),
      body: Column(
        children: [
          SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: catString.length+1,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        checkindex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: checkindex == index
                                ? const Color.fromARGB(255, 108, 95, 171)
                                : const Color.fromARGB(255, 170, 155, 235)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            index == 0 ? 'All' : catString[index - 1],
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )),
          Expanded(
              child: ListView.builder(
            itemCount: servnameCheck(checkindex).length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://static.vecteezy.com/system/resources/previews/020/549/092/non_2x/teen-girl-carry-bags-helping-elderly-woman-with-grocery-shopping-kind-caring-granddaughter-hold-products-help-old-grandmother-with-heavy-packages-older-and-younger-generation-illustration-vector.jpg'))),
                        width: double.infinity,
                        height: 200,
                      ),
                      Text(
                        '${servnameCheck(checkindex)[index]}',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '${servDscCheck(checkindex)[index]}',
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      Text(
                        'Price: ₹200',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      const Color.fromARGB(255, 64, 134, 66))),
                              onPressed: () {
                                Get.to(PersonGridView(
                                  servname:
                                      '${servnameCheck(checkindex)[index]}',
                                ));
                              },
                              child: Text(
                                'Choose',
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}

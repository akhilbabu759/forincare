import 'package:flutter/material.dart';
import 'package:fourincare/detail_book/view/detail_book.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fourincare/person_select/controller/controller.dart';
import 'package:get/get.dart';

class PersonGridView extends StatelessWidget {
  final String servname;
  final List<Map<String, dynamic>> people = [
    {
      'image':
          'https://via.placeholder.com/150', // Replace with actual image URLs
      'name': 'John Doe',
      'age': 30,
      'gender': 'Male',
      'rate': '\$50/hr',
      'rating': 4.5,
    },
    {
      'image':
          'https://via.placeholder.com/150', // Replace with actual image URLs
      'name': 'Jane Smith',
      'age': 25,
      'gender': 'Female',
      'rate': '\$45/hr',
      'rating': 4.0,
    },
    // Add more people as needed
  ];

  PersonGridView({super.key, required this.servname});

  @override
  Widget build(BuildContext context) {
  final perC=  Get.put(PersonFetch());
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: GetBuilder<PersonFetch>(
        initState: (state) {
          perC.personDetailsFetch();
        },
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.sizeOf(context).width < 330 ? 1 : 2,
                childAspectRatio:
                    MediaQuery.sizeOf(context).width < 330 ? 0.7 / 0.8 : .55,
              ),
              itemCount: perC.catergorypeople.length,
              itemBuilder: (context, index) {
                final person = perC.catergorypeople[index];
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        person['pic'].toString(),
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Name: ${person['name']}',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Age: ${person['age']}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Gender: ${person['gender']}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: RatingBar.builder(
                          itemSize: 15,
                          initialRating: person['rating']??0.0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print('Rating updated to $rating');
                          },
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.green)),
                            onPressed: () {
                              // Handle select button press
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetailsAndBook(
                                  servName: '${servname}',
                                  person: person,
                                ),
                              ));
                              print('${person['name']} selected');
                            },
                            child: Text(
                              'Select',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

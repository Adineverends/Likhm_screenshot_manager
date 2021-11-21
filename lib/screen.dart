

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:likhm/showimages.dart';
class screenshot extends StatefulWidget {
  @override
  _screenshotState createState() => _screenshotState();
}

class _screenshotState extends State<screenshot> {


final _formKey = GlobalKey<FormState>();
var name=" ";
final namee = TextEditingController();
late String value;

@override
void dispose() {
  // TODO: implement dispose
  super.dispose();
  namee.dispose();
}



clearText() {
 namee.clear();
}









final Stream<QuerySnapshot> studentsStream =
FirebaseFirestore.instance.collection('folder').snapshots();

CollectionReference students =
FirebaseFirestore.instance.collection('folder');

Future<void> deleteUser(id) {
  // print("User Deleted $id");
  return students
      .doc(id)
      .delete()
      .then((value) => print('User Deleted'))
      .catchError((error) => print('Failed to Delete user: $error'));
}

Future<void> addUser() {
  return students
      .add({'name': name,})
      .then((value) => print('User Added'))
      .catchError((error) => print('Failed to Add user: $error'));
}



@override
  Widget build(BuildContext context) {
    return
      StreamBuilder<QuerySnapshot>(
        stream: studentsStream,
        builder: (BuildContext context,
        AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        print('Something went Wrong');
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      final List storedocs = [];
      snapshot.data!.docs.map((DocumentSnapshot document) {
        Map a = document.data() as Map<String, dynamic>;
        storedocs.add(a);
        a['id'] = document.id;
      }).toList();

      return  Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40,left: 26,right: 26),

        child: Column(
          children: [
            Container(
              height: 50,
              width: 420,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 4),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                      hintText: 'Search',
                      border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 20)
                  ),
                ),
              ),

            ),

            SizedBox(height: 25,),




            SingleChildScrollView(
              child: Container(
                height: 500,
                width: 500,
                decoration: BoxDecoration(
                  // color: Colors.blue
                ),

                child: ListView(
                    children: [
                      for(var i=0;i<storedocs.length;i++)...[
                        InkWell(

                          onTap: (){
                            setState(() {
                              Navigator.push(context,MaterialPageRoute(builder: (_)=>image(value:storedocs[i]['name'])));

                            });
                          },
                          child: ListTile(
                              leading: Image.asset('image/folder.png'),
                              title:Text(storedocs[i]['name']),
                              subtitle: Text('03/4/2021'),
                              trailing: IconButton(icon: Icon(
                                  Icons.keyboard_arrow_down),
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius
                                              .circular(20)
                                      ),
                                      isScrollControlled: true,
                                      builder: (context) {
                                        return Padding(
                                            padding: MediaQuery
                                                .of(context)
                                                .viewInsets,
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 20, top: 20),
                                                child: Column(
                                                    mainAxisSize: MainAxisSize
                                                        .min,
                                                    crossAxisAlignment: CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      InkWell(


                                                          child: ListTile(
                                                            leading: Icon(
                                                                Icons.edit),
                                                            title: Text(
                                                                'Rename Folder'),
                                                          ),

                                                          onTap: () {


                                                          }
                                                      ),
                                                      InkWell(
                                                        child: ListTile(
                                                          leading: Icon(
                                                            Icons.delete,
                                                            color: Colors.red,),
                                                          title: Text(
                                                              'Delete Folder'),
                                                        ),
                                                        onTap: () {
                                                          setState(() {
                                                            deleteUser(storedocs[i]['id']);
                                                            Navigator.pop(context);

                                                          });

                                                        },
                                                      ),

                                                      Divider(),


                                                      //  SizedBox(height: 14,)

                                                      InkWell(

                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .only(
                                                              left: 40),
                                                          height: 50,
                                                          width: 270,
                                                          decoration: BoxDecoration(
                                                              border: Border
                                                                  .all(
                                                                  color: Colors
                                                                      .grey),
                                                              borderRadius: BorderRadius
                                                                  .circular(
                                                                  6),
                                                              color: Colors
                                                                  .grey
                                                                  .shade200
                                                          ),

                                                          child: Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                  left: 90,
                                                                  top: 14),
                                                              child: Text(
                                                                'Close',
                                                                style: TextStyle(
                                                                    fontSize: 22,
                                                                    fontWeight: FontWeight
                                                                        .w400,
                                                                    color: Colors
                                                                        .grey),)),
                                                        ),

                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),

                                                      SizedBox(height: 20,),

                                                    ]
                                                )
                                            )
                                        );
                                      },
                                    );
                                  }
                              )
                          ),
                        ),
                      ],
                      SizedBox(height: 30,)
                    ]


                ),
              ),
            )


          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              builder: (context) {
                return Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: Container(
                    margin:EdgeInsets.only(left: 20,top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        Text("Create New Folder",
                          style: TextStyle(color: Colors.black, fontSize: 20),),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Image.asset('image/folder.png', height: 40,),
                            SizedBox(width: 19,),
                            Container(
                              height: 40,
                              width: 320,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                //  borderRadius: BorderRadius.all(7)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: TextField(
                                  controller: namee,
                                  onChanged: (text){
                                    var value=text;
                                  },
                                  decoration: InputDecoration(
                                      hintText: 'Folder Name',
                                      border: InputBorder.none
                                  ),
                                ),
                              ),

                            )
                          ],
                        ),
                        SizedBox(height: 30,),

                        Row(
                          children: [

                            InkWell(
                              onTap: (){
                                setState(() {
                                  Navigator.pop(context);
                                });
                              },


                              child: Container(
                                height: 40,
                                width: 170,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(5)
                                  //  borderRadius: BorderRadius.all(7)
                                ),
                                child:  Padding(
                                  padding: const EdgeInsets.only(left: 65,top: 10),
                                  child: Text('CLOSE',style: TextStyle(fontSize: 14,color: Colors.grey.shade500),),
                                ),

                              ),
                            ),

                            SizedBox(width: 28,),

                            InkWell(

                              onTap: (){

                               setState(() {
                                 name=namee.text;
                                 addUser();
                                 Navigator.pop(context);
                                 clearText();
                               });




                              },














                              child: Container(
                                height: 40,
                                width: 170,


                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey.shade300),
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(7)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10,top: 10),
                                  child: Text('CREATE NEW FOLDER',style: TextStyle(fontSize: 14,color: Colors.white),),
                                ),

                              ),
                            )

                          ],
                        ),

                        SizedBox(height: 30,)


                      ],
                    ),
                  ),
                );
              }


          );


        },
        backgroundColor: Colors.white,
        child: Image.asset('image/folder.png', height: 39,),
      ),
    );
  }
      );






}
}

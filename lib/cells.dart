import 'package:flutter/material.dart';
class cell extends StatefulWidget {
  @override
  _cellState createState() => _cellState();
}

class _cellState extends State<cell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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

                            Container(
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

                            SizedBox(width: 28,),

                            InkWell(
                              onTap: (){
                                setState(() {

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
}

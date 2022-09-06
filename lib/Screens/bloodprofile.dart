import 'package:flutter/material.dart';

class bloodprof extends StatefulWidget {
  var value;
  bloodprof({this.value});

  @override
  State<bloodprof> createState() => _bloodprofState();
}

class _bloodprofState extends State<bloodprof> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(widget.value['Name']),
          backgroundColor: Colors.red,
          actions: [
            IconButton(
                onPressed: () => [], icon: Icon(Icons.favorite_border_outlined))
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Container(
                //       height: 200,
                //       width: 200,
                //       child: Image.network(widget.value['person_image'])),
                // ),
                Text(
                  widget.value['Name'],
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Demo Price : ',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.value['Name'],
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                'About the person:-',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Text(
                widget.value['Name'],
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                onPressed: () => [],
                child: Text(
                  'Add To Cart',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                minWidth: MediaQuery.of(context).size.width,
                color: Colors.deepOrange,
              ),
            )
          ],
        ));
  }
}

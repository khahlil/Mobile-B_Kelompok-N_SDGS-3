import 'package:flutter/material.dart';

class InfoPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Kelompok N SDGS 3 - IF')),
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: 'hero',
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 100.0,
                child: Image.asset('assets/images/logo-text-t.png'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.looks_one, color: Colors.blueGrey),
              title: Text("Khahlil Gilbran",
                  style: Theme.of(context).textTheme.subtitle2),
              trailing: Text('182410103048'),
            ),
            ListTile(
              leading: Icon(Icons.looks_two, color: Colors.blueGrey),
              title: Text("Abizhar Nazha",
                  style: Theme.of(context).textTheme.subtitle2),
              trailing: Text('182410103049'),
            ),
            ListTile(
              leading: Icon(Icons.looks_3, color: Colors.blueGrey),
              title: Text("M. Indefandia K",
                  style: Theme.of(context).textTheme.subtitle2),
              trailing: Text('182410103072'),
            )
          ],
        ),
      ),
    );
  }
}

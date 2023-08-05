import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.green,),
        width: MediaQuery.of(context).size.width-60,
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  IconButton(onPressed: (){}, icon: const Icon(Icons.home,color: Colors.white,)),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.note_alt,color: Colors.white)),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.chat,color: Colors.white)),
                ],),
                IconButton(onPressed: (){}, icon: const Icon(Icons.manage_accounts_sharp,color: Colors.white,))
          ]),
        ),
      ),
      body: const Center(
        child: Text('HomePage'),
      ),
    );
  }
}

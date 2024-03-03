
import 'package:adminor/people.dart';
import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:chat_bubbles/date_chips/date_chip.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
final now = DateTime.now();
class Chat extends StatefulWidget {
  final int index;
  const Chat({Key? key, required this.index}) : super(key: key);



  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final int itemCount=12;
  static const Color senderBackColor=Colors.green;
  static const Color senderFontColor=Colors.white;
  static const Color receiverFontColor=Colors.black;
  static const Color receiverBackColor=Colors.white;
  static const double borderRadius=35;


  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(elevation:0,actions:[IconButton(onPressed: (){
        Navigator.of(context).pop();},
          icon: const Icon(Icons.arrow_forward,color: Colors.black,))],
        leading:IconButton(onPressed: (){
        },icon: const Icon(Icons.list,color: Colors.black,)),
        backgroundColor: Colors.white,
        title:  Text(name[widget.index],
            style: const TextStyle(fontFamily: 'Shabnam',color: Colors.black)),centerTitle: true,),
      body: SafeArea(child: SingleChildScrollView(
        child: Column(children: [
          Container(color:Colors.white,width: double.infinity,
          child: Column(children: [
            SizedBox(width:100,height:100,child: ClipRRect(borderRadius: BorderRadius.circular(25),child: Image.asset(url[widget.index]))),
            const SizedBox(height: 15,),
             Text('شما درحال پیام دادن به ${name[widget.index]} هستید',style: TextStyle(fontFamily: 'Vazir',color:Colors.grey.withOpacity(0.8),fontSize: 16),),
          ]),),
        Column(children: [
          Container(color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(padding:const EdgeInsets.only(bottom: 10),decoration:BoxDecoration(borderRadius:  BorderRadius.circular(borderRadius),color: Colors.grey.withOpacity(0.1)),width: double.infinity,height: height-315,child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: ListView.builder(reverse: true,itemCount: itemCount,itemBuilder: (context, index) =>
                    index%2==0?
                    Column(
                      children: [
                        DateChip(
                          date:  DateTime(now.year, now.month, now.day - 2),
                        ),
                        const Padding(
                            padding: EdgeInsets.fromLTRB(5,0,0,5),
                            child:BubbleSpecialOne(
                                text: 'bubble special one with tail',
                                isSender: true,
                                color: senderBackColor,
                                textStyle: TextStyle(
                                  fontFamily: '',
                                  fontSize: 20,
                                  color: senderFontColor,
                                ))
                        ),
                        BubbleNormal(
                          text: 'bubble normal without tail',
                          isSender: false,
                          color: senderBackColor,
                          tail: false,
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontFamily: '',
                            color: senderFontColor,
                          ),
                        ),

                      ],
                    ):
                    const Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(5,0,0,5),
                            child:BubbleSpecialOne(
                                text: 'bubble special one with tail',
                                isSender: false,
                                color: receiverBackColor,
                                textStyle: TextStyle(
                                  fontFamily: '',
                                  fontSize: 20,
                                  color: receiverFontColor,
                                ))
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(5,0,0,5),
                            child:BubbleSpecialOne(
                                text: 'bubble special one with tail',
                                tail: false,
                                isSender: false,
                                color: receiverBackColor,
                                textStyle: TextStyle(
                                  fontFamily: '',
                                  fontSize: 20,
                                  color: receiverFontColor,
                                ))
                        ),
                      ],
                    )
                ),
              ),),
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,child: MessageBar(
            messageBarColor: Colors.white10,
              messageBarHitText: 'اینجا بنویسید',
              messageBarHintStyle: const TextStyle(fontFamily: 'Vazir'),
              onSend: (_) => print(_),
              actions: [
                InkWell(
                  child:const Padding(
                    padding: EdgeInsets.only(right: 8.0,left: 8),
                    child: Icon(CupertinoIcons.paperclip,color: Colors.blue,size: 24,),
                  ),
                  onTap: () {},
                ),

              ],
            ),
          ),
        ],)
        ],),
      )),
    );
  }
}

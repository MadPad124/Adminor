
import 'dart:ui';
import 'package:adminor/AdeversitingPages/AdvertisingDetailPage.dart';
import 'package:adminor/Settings/settingsPage.dart';
import 'package:adminor/api/Functions.dart';
import 'package:adminor/chat/displayChatPage.dart';
import 'package:flutter/painting.dart';
/*
import 'package:liquid_swipe/liquid_swipe.dart';
*/
import '../structure.dart';
import 'NewAdversitingPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adminor/cities.dart';
//import 'package:flutter/scheduler.dart';
List<String> filteredCities=[];
List<String> allData=[];
List<bool> isChecked=[];
List checkedList=['تهران'];
ValueNotifier<String> valueNotifier=ValueNotifier('notAllChecked');
ValueNotifier<bool> valueNotifier2=ValueNotifier(false);
ValueNotifier<bool> valueNotifier3=ValueNotifier(false);
TextEditingController searchBoxController2=TextEditingController();
class Advertising extends StatefulWidget {
  const Advertising({super.key});
  @override
  State<Advertising> createState() => _AdvertisingState();
}
class _AdvertisingState extends State<Advertising> {
  @override
  void initState(){
    if(allData.isEmpty){
      for(int i=0;i<users.length;i++){
        allData.add(users[i].name);
      }}
    favorites.isEmpty?getFavorites():null;
    checkRating();
    isChecked=cities.values.toList();
    cache.read('name')!=null?null:getInfo(cache.read('telephone'));
    getInfo(cache.read('telephone'));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  var w=MediaQuery.of(context).size.width;
    TextEditingController searchBoxController=TextEditingController();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        toolbarHeight: 150,
        flexibleSpace:Row(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const SizedBox(width: 30,),
            Column(
              //mainAxisAlignment: MainAxisAlignment.center,

              children: [

/*                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Adminor',style: TextStyle(fontFamily: 'Vazir',fontWeight: FontWeight.w300,fontSize: 24,color: Colors.white),),
                ),*/
                const SizedBox(height: 50,),
                Container(width:MediaQuery.of(context).size.width-50,height:50,
                    decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width-200,
                            child: TextField(
                              onTap: () => showSearch(context: context, delegate: CustomSearch()),
                              keyboardType: TextInputType.text,
                          style: const TextStyle(fontFamily: 'Vazir',color: Colors.black),
                          textDirection: TextDirection.rtl,
                              controller: searchBoxController2,
                          autofocus: false,
                          readOnly: true,
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(fontFamily: 'Shabnam'),
                            hintText: 'جستجو...',
                              border: UnderlineInputBorder(borderSide: BorderSide.none),
                              prefixIcon : Padding(
                                padding: EdgeInsets.only(right: 15.0),
                                child: Icon(Icons.search),
                              ),prefixIconColor: Colors.grey),
                            )),
                               InkWell(
                                onTap: (){

                                  showDialog(context: context, builder: (context) => AlertDialog(contentPadding: const EdgeInsets.only(top:10),title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('انتخاب استان',style: TextStyle(fontFamily: 'Vazir',color: Colors.black,fontSize: 20),),
                                      ValueListenableBuilder<String>(
                                        valueListenable: valueNotifier,
                                        builder: (context, value, child) => IconButton(onPressed: (){

                                          if(valueNotifier.value=='notAllChecked'){
                                            checkedList=[];
                                            for(int i =0;i<31;i++){
                                              isChecked[i]=true;
                                              valueNotifier.value=i.toString();
                                            }
                                            cities.updateAll((key, value) => true);
                                            checkedList.addAll(cities.keys);
                                            valueNotifier.value='allChecked';
                                            valueNotifier2.value=!valueNotifier2.value;
                                           // print('object8');

                                          }
                                          else if(valueNotifier.value=='someChecked'){
                                            checkedList=[];
                                           // print('object7');
                                            for(int i =0;i<31;i++){
                                              isChecked[i]=true;valueNotifier.value=i.toString();
                                            }
                                            cities.updateAll((key, value) => true);
                                            checkedList.addAll(cities.keys);
                                           // print('object6');
                                            valueNotifier.value='allChecked';
                                            valueNotifier2.value=!valueNotifier2.value;
                                          }
                                          else if(checkedList.length>=2&&valueNotifier.value=='nothing'){
                                            checkedList=[];
                                          //  print('object5');
                                            for(int i =0;i<31;i++){
                                              isChecked[i]=true;valueNotifier.value=i.toString();
                                            }
                                            cities.updateAll((key, value) => true);
                                            checkedList.addAll(cities.keys);
                                           // print('object4');
                                            valueNotifier.value='allChecked';
                                            valueNotifier2.value=!valueNotifier2.value;

                                          }
                                          else if (valueNotifier.value=='allChecked'){
                                           // print('object3');
                                            checkedList=[];
                                            checkedList=['تهران'];
                                          cities.forEach((k, v) {cities.update(k, (value) => value=false); });
                                            cities.update('تهران', (value) => value=true);
                                            isChecked=[];
                                            isChecked.addAll(cities.values);
                                            valueNotifier.value='notAllChecked';
                                            valueNotifier2.value=!valueNotifier2.value;
                                          }
                                          }, icon:  Icon(valueNotifier.value=='allChecked'?Icons.check_box:Icons.indeterminate_check_box_rounded,color: Colors.green,)),
                                      )
                                    ],
                                  ),
                                  content: SingleChildScrollView(
                                    child: SizedBox(
                                        width: MediaQuery.of(context).size.width,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width:MediaQuery.of(context).size.width,
                                              child: Padding(
                                                padding: const EdgeInsets.only(bottom: 15.0,right: 25,left: 25),
                                                child:  ValueListenableBuilder<bool>(valueListenable: valueNotifier2,builder: (context, value, child) => Text(checkedList.isEmpty?'حداقل یک شهر را انتخاب کنید':checkedList.join(' || '),style: const TextStyle(fontFamily: 'vazir',fontSize: 16) ,)),
                                              ),
                                            ),

                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 60,
                                                    //decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.grey,width: 1)),
                                                    width: MediaQuery.of(context).size.width-130,
                                                    child:
                                                    TextField(
                                                      controller: searchBoxController,
                                                      onChanged: (value) {
                                                        if(searchBoxController.text.isEmpty){
                                                          valueNotifier.value='nothing';
                                                        }
                                                        else{
                                                            valueNotifier.value=searchBoxController.text;
                                                        }

                                                        },
                                                      style: const TextStyle(fontFamily: 'Vazir',color: Colors.black),
                                                      textDirection: TextDirection.rtl,
                                                      decoration:  InputDecoration(
                                                        enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.grey,width: 1),borderRadius: BorderRadius.circular(8)),
                                                        hintText: 'استان را انتخاب کنید',
                                                        hintStyle: const TextStyle(fontSize: 16),
                                                        suffixIcon: const Icon(Icons.search),
                                                        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(width:1,color: Colors.teal)),
                                                        border: const UnderlineInputBorder(borderSide: BorderSide.none),
                                                      ),)),
                                              ],
                                            ),
                                            Center(
                                              child: SizedBox(
                                                height: 240,
                                                width: MediaQuery.of(context).size.width-130,
                                                child:ValueListenableBuilder<String>(
                                                  valueListenable: valueNotifier,
                                                  builder: (context, value, child) {
                                                    if(searchBoxController.text.isNotEmpty){
                                                      if(checkedList.length==31){
                                                         filteredCities=[];
                                                         }
                                                      else{
                                                        filteredCities=[];
                                                        isChecked=[];
                                                        //isChecked.addAll(cities.values);
//======================================================================================================
                                                        cities.forEach((key, value) {
                                                          if(key.contains(searchBoxController.text)){
                                                            isChecked.add(value);}
                                                        });
//======================================================================================================

                                                      }
                                                      cities.forEach((key, value) {
                                                        if(key.contains(searchBoxController.text)){
                                                          filteredCities.add(key);
                                                        }
                                                      });
                                                    }
                                                    else{
                                                      if(checkedList.length==31){
                                                      filteredCities=[];
                                                      filteredCities.addAll(cities.keys);
                                                      //print('object1');

                                                      }
                                                     else{
                                                       isChecked=cities.values.toList();
                                                       //print('${isChecked}218');
                                                     filteredCities=[];
                                                     filteredCities.addAll(cities.keys);}

                                                    }
                                                   return ListView.builder(itemCount: filteredCities.length>1?filteredCities.length:1, itemBuilder: (context, index) {
                                                      return Column(
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(top: 8.0),
                                                            child: SizedBox(
                                                              height: 60,
                                                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  Expanded(child: Padding(
                                                                    padding: const EdgeInsets.only(right: 8.0),
                                                                    child: StatefulBuilder(builder: (BuildContext context, StateSetter setState){
                                                                        return filteredCities.isNotEmpty?
                                                                        CheckboxListTile(
                                                                          checkColor: Colors.white,
                                                                          fillColor: MaterialStateProperty.all(Colors.teal),
                                                                          title: Text(filteredCities[index],style:const TextStyle(fontSize: 16, fontFamily: 'Vazir')),
                                                                          value:isChecked[index],
                                                                          onChanged: (value) {
                                                                      setState(
                                                                      () {
                                                                        if(checkedList.length>=31){
                                                                          cities.forEach((k, v) {
                                                                            if(k==filteredCities[index]){
                                                                              cities.update(k, (value) => value=!v);
                                                                              isChecked[index]=!isChecked[index];
                                                                               checkedList.remove(k);
                                                                              valueNotifier.value='someNotChecked';
                                                                              valueNotifier.value='someChecked';
                                                                              valueNotifier2.value=!valueNotifier2.value;
                                                                            }
                                                                          });
                                                                        }


                                                                        else{
                                                                          cities.forEach((k, v) {
                                                                            if(k==filteredCities[index]){
                                                                              cities.update(k, (value) => value=!v);
                                                                              isChecked=cities.values.toList();


                                                                              if(checkedList.length==31){
                                                                                valueNotifier.value='allChecked';}

                                                                              else/*(checkedList.length<30)*/{
                                                                                valueNotifier.value='someNotChecked';
                                                                                valueNotifier.value='someChecked';
                                                                              }


                                                                              if(checkedList.contains(k)){
                                                                                checkedList.remove(k);

                                                                                valueNotifier2.value=!valueNotifier2.value;
                                                                              }
                                                                              else{
                                                                                checkedList.add(k);
                                                                                checkedList.sort();
                                                                                valueNotifier2.value=!valueNotifier2.value;
                                                                              }
                                                                            }

                                                                            //print(checkedList);
                                                                            //print(isChecked);
                                                                          });

                                                                        }
                                                                      },
                                                                      );
                                                                      },
                                                                      secondary: const Icon(CupertinoIcons.circle_grid_hex,color: Colors.green,),
                                                                      ):const Row(
                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                        children: [

                                                                          Center(child: Text('موردی یافت نشد',style:TextStyle(fontSize: 16, fontFamily: 'Vazir',color: Colors.red))),
                                                                          Icon(Icons.error,color: Colors.redAccent,),
                                                                        ],
                                                                      );
                                                                      })
                                                                    ,
                                                                  )),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Container(height: 1,
                                                            width: MediaQuery
                                                                .of(context)
                                                                .size
                                                                .width - 140,
                                                            decoration: BoxDecoration(border: Border(bottom: BorderSide(
                                                              color: Colors.grey.withOpacity(0.4), width: 1,))),)
                                                        ],
                                                      );
                                                    });
                                                  },
                                                )
                                              )
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(height: 10,),
                                                Expanded(child: Container(
                                                  decoration: const BoxDecoration(borderRadius:BorderRadius.only(bottomLeft:Radius.circular(25),bottomRight:Radius.circular(25) ),color: Colors.blue,),
                                                  child: TextButton(onPressed: (){
                                                    users=[];
                                                    for(int j=0;j<checkedList.length;j++){
                                                      for(var i in userResponse){
                                                        if(i['city'].toString().contains(checkedList[j])){
                                                          var userItem=UserStructure(int.parse(i['id']), i['phone'], i['adminPhone'],i['name'], i['price'], i['type'], i['image'], i['city'], i['dealType'], i['payment_Method'], i['startTime'], i['endTime'], i['special_Conditions'], i['history'], i['email_1'], i['email_2'],i['status']);
                                                          users.add(userItem);
                                                        }
                                                        else{continue;}
                                                      }
                                                    }
                                                    Navigator.of(context).pop();
                                                    setState(() {

                                                    });
                                                    },style: ButtonStyle(
                                                      minimumSize: MaterialStateProperty.all(const Size(80, 30)),backgroundColor:MaterialStateProperty.all(Colors.blue),padding: MaterialStateProperty.all(const EdgeInsets.all(15))), child: const Text('فیلتر',style: TextStyle(color: Colors.white,fontFamily: 'Shabnam'),)),
                                                )),
                                                const SizedBox(height: 10,),
                                              ],
                                            ),
                                          ],
                                        ),

                                    ),
                                  )),);
                                },
                                child: Row(
                                  textDirection: TextDirection.ltr,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Icon(Icons.location_city,color: CupertinoColors.activeBlue,),
                                    ),
                                    const SizedBox(width: 5,),
                                    ValueListenableBuilder<String>(valueListenable: valueNotifier,builder:(context, value, child) =>  Text(checkedList.length>1?'${checkedList.length.toString()} شهر':checkedList.first,style: const TextStyle(fontFamily: 'Shabnam'),)),
                                    ],),
                              )

                      ],
                    )),
                const SizedBox(height: 10,),
                SizedBox(width: w-50,height:60,child: ListView.builder(scrollDirection:Axis.horizontal,itemCount:checkedList.length,itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: InkWell(
                      overlayColor: MaterialStateProperty.all(Colors.red.withOpacity(0.3)),
                      onLongPress: () {
                        if(checkedList.length==1){
                          isChecked[index]=false;
                          cities.update(checkedList[index], (value) => false);
                          checkedList.removeAt(index);
                          checkedList.add('تهران');
                          cities.update('تهران', (value) => true);

                            users=[];
                            for(var i in userResponse){
                              if(i['city'].toString().contains('تهران')){
                                var userItem=UserStructure(int.parse(i['id']), i['phone'], i['adminPhone'],i['name'], i['price'], i['type'], i['image'], i['city'], i['dealType'], i['payment_Method'], i['startTime'], i['endTime'], i['special_Conditions'], i['history'], i['email_1'], i['email_2'],i['status']);
                                users.add(userItem);
                              }
                          }
                          setState(() {

                          });
                        }
                        else{
                          cities.update(checkedList[index], (value) => false);
                          isChecked[index]=false;
                          checkedList.removeAt(index);
                          for(int j=0;j<checkedList.length;j++){
                            users=[];
                            for(var i in userResponse){
                              if(i['city'].toString().contains(checkedList[j])){
                                var userItem=UserStructure(int.parse(i['id']), i['phone'], i['adminPhone'],i['name'], i['price'], i['type'], i['image'], i['city'], i['dealType'], i['payment_Method'], i['startTime'], i['endTime'], i['special_Conditions'], i['history'], i['email_1'], i['email_2'],i['status']);
                                users.add(userItem);
                              }
                            }
                          }
                          setState(() {
                          });
                        }
                    },
                      child: Container(height:30,width:130,decoration: BoxDecoration(color: Colors.green.withOpacity(0.1),border: const Border(bottom: BorderSide(color: Colors.white,width: 2))),child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text( checkedList[index],style: const TextStyle(fontFamily: 'Shabnam',color: Colors.white,fontSize: 12),)),
                      ),),
                    ),
                  );
                },),)



              ],)
          ],
        ),
      ),
          floatingActionButton: bottomMenu(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    body: GestureDetector(
        onTap: (){
      FocusScope.of(context).requestFocus(FocusNode());
    },
    child: Stack(children: [
      Align(
        alignment: Alignment.bottomCenter,
        child: Image.asset(
          'assets/images/splash-bottom-page-image-sun.png',
          opacity: const AlwaysStoppedAnimation(.3),
        ),
      ),
      Align(alignment: Alignment.bottomCenter,child: Image.asset('assets/images/splash-bottom-page-image.png')),

        users.isEmpty? const Center(child: CircularProgressIndicator()):Padding(
          padding: const EdgeInsets.only(bottom: 80.0),
          child: ListView.builder(itemCount: users.length,itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 3,top: 12,right: 15,left: 15),
              child: InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => AdvertisingDetail(index: index),)),
                child: Container(
                    width: w-50,
                    height: 120,
                    decoration: BoxDecoration(color:Colors.green.withOpacity(0.1),border: Border.all(color: Colors.green,width: 1),borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SizedBox(

                            height: 100,
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(users[index].name,style: const TextStyle(fontFamily: 'Vazir',fontSize: 18,color: Colors.teal),),
                                  const SizedBox(height: 5,),
                                  Text(users[index].type,style: const TextStyle(fontFamily: 'Vazir',fontSize: 16,color: Colors.black),),
                                  const SizedBox(height: 5,),
                                  Text(users[index].city,style: const TextStyle(fontFamily: 'Vazir',fontSize: 16,color: Colors.red),),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Image.network(users[index].image,width: 80,height: 80,fit: BoxFit.fill,),
                        )
                      ],)
                ),
              ),
            );

          },
          ),
        )
      ]),),
    );
  }
}
Widget bottomMenu(context) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: const [BoxShadow(color: Colors.grey,blurRadius: 5)],
      borderRadius: BorderRadius.circular(25), color: Colors.green,),
    width: MediaQuery.of(context).size.width - 20,
    child: Padding(
      padding: const EdgeInsets.all(7.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () {},
                    icon: const Icon(Icons.home, color: Colors.white,)),
                IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const DisplayChat(),));},
                    icon: const Icon(Icons.chat, color: Colors.white)),
                IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const NewAdvertising(),));},
                    icon: const Icon(Icons.add_circle, color: Colors.white)),
              ],),
            IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) =>const Settings(),));},
                icon: const Icon(
                  Icons.manage_accounts_sharp, color: Colors.white,))
          ]),
    ),

  );

}
class CustomSearch extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(onPressed: (){
        if(query.isEmpty){Navigator.of(context).pop();}
        else{query='';searchBoxController2.clear();}
      }, icon: const Icon(Icons.clear,color: Colors.red,))
    ];
  }
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      close(context, null);
    }, icon: const Icon(Icons.arrow_back,color: Colors.blue,));
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery=[];
    for(var item in allData){
      if(item.contains(query)){
        matchQuery.add(item);
      }
    }
    return matchQuery.isEmpty?const Center(child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('موردی یافت نشد',style: TextStyle(fontFamily: 'Shabnam',fontSize: 22),),
        SizedBox(width: 10,),
        Icon(Icons.search_off_outlined,color: Colors.green,size: 44,),
    ],),):ListView.builder(itemCount: matchQuery.length,itemBuilder: (context, index) {
      var result =matchQuery[index];
      return InkWell(
        onTap: () {
          for(int k=0;k<users.length;k++){
            if(matchQuery[index]==users[k].name){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AdvertisingDetail(index: k),));
          }
          }

        },
        child: ListTile(title: Text(result,style: const TextStyle(fontFamily: 'Shabnam'),),
        ),
      );
    },
    );
  }
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery=[];
    for(var item in allData){
      if(item.contains(query)){
        matchQuery.add(item);
      }
    }
    return ListView.builder(itemCount: matchQuery.length,itemBuilder: (context, index) {
      var result =matchQuery[index];
      return InkWell(
        onTap: () {
        },
        child: ListTile(title: Text(result,style: const TextStyle(fontFamily: 'Shabnam'),),
        ),
      );
    },
    );
  }

}

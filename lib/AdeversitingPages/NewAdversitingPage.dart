
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../cities.dart';
import 'AdvertisingPage.dart';
var otherChoice =false;
var enabledCheckBox=true;
class NewAdvertising extends StatefulWidget {
  const NewAdvertising({Key? key}) : super(key: key);

  @override
  State<NewAdvertising> createState() => _NewAdvertisingState();
}

class _NewAdvertisingState extends State<NewAdvertising> {
  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    List<String> filteredCities=[];
    List<bool> isChecked=[];
    List checkedList=['تهران'];
    ValueNotifier<String> valueNotifier=ValueNotifier('notAllChecked');
    ValueNotifier<bool> valueNotifier2=ValueNotifier(false);
    ValueNotifier<bool> valueNotifier3=ValueNotifier(false);
    double start = 30.0;
    double end = 50.0;
    String? selectedValue;
    var items = [
      'ایتا ',
      'سروش ',
      'بله ',
      'روبیکا ',
      'آی گپ ',
      'سایت',
      'شاد',
      'گپ',
      'ویراستی',
      'نوا',
      'چتزی',
      'آیوا',
    ];
    String? selectedValue2;
    var items2 = [
      'تمام وقت',
      'پاره وقت',
      'پیمان کاری',
      'کارآموزی',
      'سایر ',
    ];
    String? selectedValue3;
    var items3 = [
      'ماهانه',
      'روزانه',
      'پورسانتی/درصدی',
      'توافقی',
    ];
    String? selectedValue4;
    var items4 = [
      '6',
      '7',
      '8',
      '9',
      '10',
      '11',
      '12',
      '13',
      '14',
      '15',
      '16',
      '17',
      '18',
      '19',
      '20',
      '21',
      '22',
      '23',
      '24',
      '1',
      '2',
      '3',
      '4',
      '5',
    ];
    String? selectedValue5;
    var items5 = [
      '16',
      '17',
      '18',
      '19',
      '20',
      '21',
      '22',
      '23',
      '24',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
      '11',
      '12',
      '13',
      '14',
      '15',
    ];
    String? selectedValue6;
    var items6 = [
      'کمتر از 1 سال',
      'حداقل 1 سال',
      'حداقل 2 سال',
      'حداقل 3 سال',
      'حداقل 4 سال',
      'حداقل 5 سال',
      'حداقل 6 سال',
    ];
    String? selectedValue7;
    var items7 = [
      'اتمام یا معافیت',
      'فرقی ندارد',
    ];
    TextEditingController searchBoxController=TextEditingController();

    return Scaffold(
      floatingActionButton:SizedBox(
        width: MediaQuery.of(context).size.width-30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(heroTag:'btn1',backgroundColor: Colors.green,onPressed: (){/*Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Advertising(),));*/},child: const Directionality(textDirection: TextDirection.rtl,child: Icon(Icons.done,color: Colors.white,))),
            FloatingActionButton(heroTag:'btn2',backgroundColor: Colors.white,onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Advertising(),));},child: const Directionality(textDirection: TextDirection.ltr,child: Icon(CupertinoIcons.back,color: Colors.green,))),
          ],),
      ),
      body:/*GestureDetector(
        onTap: ()=>FocusScope.of(context).requestFocus(FocusNode()),
        child: */SafeArea(
          child:
          SingleChildScrollView(
            child: Form(
              key: formkey ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                 const Directionality(textDirection: TextDirection.rtl,child: Padding(
                   padding: EdgeInsets.only(top: 0.0,bottom: 5,right: 10),
                   child: Text("افزودن ادمین",style: TextStyle(fontFamily: 'Shabnam',fontSize: 18),),
                 )),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                    },
                        child: Image.asset('assets/images/user avatar.png',width: 50,height: 50,)),
                  ),
                ],),
                  //avatar-----------------------------------------
                Container(width: MediaQuery.of(context).size.width,decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey,width: 0.1))),),
                const SizedBox(height: 15,),
                  //name field-----------------------------------------
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(onTap:(){},controller:searchBoxController,validator:(value) {return 'فیلد نمیتونه خالی باشه';},decoration: const InputDecoration(labelText: 'نام و نام خانوادگی',labelStyle: TextStyle(fontFamily: 'Shabnam'),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 1.5)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2))
                    ),),
                  ),

                  //avatar-----------------------------------------
                  //ادمین چی باشه؟ ----------------------------------
                  enabledCheckBox==false?Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(decoration: const InputDecoration(
                        hintText: 'اینجا بنویس',hintStyle: TextStyle(fontFamily: 'Shabnam'),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 1.5)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2))
                    ),),
                  ):
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  DropdownButtonFormField(
                        enableFeedback: false,
                        alignment: Alignment.centerRight,
                        style:  TextStyle(fontFamily: "Shabnam",color: Colors.grey.shade600,fontSize: 16),
                        decoration: InputDecoration(
                          enabled: enabledCheckBox,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.green, width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.green, width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) => value == null ? "یک گذینه را انتخاب کنید" : null,
                        dropdownColor: Colors.white,
                        isExpanded: true,
                        value: selectedValue,
                        hint: const Text('ادمین چی هستی؟'),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        items:enabledCheckBox==true? items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList():null),
                  ),
                  //ادمین چی باشه؟ ----------------------------------
                  //موارد دیگر ----------------------------------
                     Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Directionality(
                      textDirection: TextDirection.rtl,
                        child: CheckboxListTile(
                          activeColor: Colors.green,
                          value: otherChoice, onChanged:
                          (value) {
                          setState(() {
                            enabledCheckBox=!enabledCheckBox;
                            otherChoice=!otherChoice;
                          });
                                  },
                            title: const Text('موارد دیگر',style: TextStyle(fontFamily: 'Shabnam'),),
                            ),
                            ),
                            ),
                  //موارد دیگر ----------------------------------
                  const SizedBox(height: 15,),
                  Center(child: Container(color: Colors.green,height: 1,width: MediaQuery.of(context).size.width-20,)),
                  const SizedBox(height: 15,),
                  const Padding(
                    padding: EdgeInsets.only(right: 15.0,top: 5,bottom: 5),
                    child: Text('ایمیل',style: TextStyle(fontFamily: 'Shabnam'),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(style: TextStyle(fontFamily: 'Vazir'),validator:(value) {return 'فیلد نمیتونه خالی باشه';},decoration: const InputDecoration(labelText: 'ایمیل',labelStyle: TextStyle(fontFamily: 'Shabnam'),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 1.5)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2))
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(style: const TextStyle(fontFamily: 'Vazir'),keyboardType: TextInputType.emailAddress,validator:(value) {return 'ایمیل اشتباه است';},decoration: const InputDecoration(labelText: 'ایمیل کارفرمای قبلی',labelStyle: TextStyle(fontFamily: 'Shabnam'),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 1.5)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2))
                    ),),
                  ),
                     const Padding(
                       padding: EdgeInsets.only(right: 15.0,top: 5,bottom: 5),
                       child: Text('قیمت',style: TextStyle(fontFamily: 'Shabnam'),),
                     ),
                  RangeSlider(
                    values: RangeValues(start, end),
                    //labels: RangeLabels(start.toString(), end.toString()),
                    onChanged: (value) {
                      setState(() {
                        print(value);
                        start = value.start;
                        end = value.end;
                      });
                    },
                    min: 10.0,
                    max: 80.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8,right: 8,left: 8,bottom: 0),
                    child:
                    TextFormField(
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
                                                hintText: 'استان را وارد کنید',
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
                                                                                //             print(checkedList);
                                                                                //            print(isChecked);
                                                                              }


                                                                            });
                                                                          }
                                                                          else{

                                                                            cities.forEach((k, v) {
                                                                              if(k==filteredCities[index]){
                                                                                cities.update(k, (value) => value=!v);
                                                                                isChecked=cities.values.toList();
                                                                                if(checkedList.length==31)
                                                                                {valueNotifier.value='allChecked';}
                                                                                //print('ooh');print( valueNotifier.value);
                                                                                else/*(checkedList.length<30)*/{
                                                                                  valueNotifier.value='someNotChecked';
                                                                                  valueNotifier.value='someChecked';
                                                                                  //           print( valueNotifier.value);
                                                                                  //           print( 'valueNotifier.value');
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
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(width: 10,),
                                          TextButton(onPressed: (){Navigator.of(context).pop();},style: ButtonStyle(minimumSize: MaterialStateProperty.all(const Size(80, 30)),backgroundColor:MaterialStateProperty.all(Colors.green),padding: MaterialStateProperty.all(const EdgeInsets.all(15))), child: const Text('تایید',style: TextStyle(color: Colors.white),)),
                                          const SizedBox(width: 5,),
                                          TextButton(onPressed: (){Navigator.of(context).pop();},style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.red),padding: MaterialStateProperty.all(const EdgeInsets.all(15))), child: const Text('انصراف',style: TextStyle(color: Colors.white),)),
                                          const SizedBox(width: 5,),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                              ),
                            )));
                        },
                      readOnly:true,decoration: const InputDecoration(suffixIcon: Icon(CupertinoIcons.location),hintText: 'شهر ',hintStyle: TextStyle(fontFamily: 'Shabnam'),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 1.5)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2))
                    ),),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 15.0,top: 10,bottom: 5),
                    child: Text('نوع همکاری',style: TextStyle(fontFamily: 'Shabnam'),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  DropdownButtonFormField(
                        enableFeedback: false,
                        alignment: Alignment.centerRight,
                        style:  TextStyle(fontFamily: "Shabnam",color: Colors.grey.shade600,fontSize: 16),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.green, width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.green, width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) => value == null ? "یک گذینه را انتخاب کنید" : null,
                        dropdownColor: Colors.white,
                        value: selectedValue2,
                        hint: const Text('انتخاب'),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue2 = newValue!;
                          });
                        },
                        items:items2.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList()),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 15.0,top: 10,bottom: 5),
                    child: Text('شیوه پرداخت',style: TextStyle(fontFamily: 'Shabnam'),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  DropdownButtonFormField(
                        hint: const Text('انتخاب'),
                        enableFeedback: false,
                        alignment: Alignment.centerRight,
                        style:  TextStyle(fontFamily: "Shabnam",color: Colors.grey.shade600,fontSize: 16),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.green, width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.green, width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) => value == null ? "یک گذینه را انتخاب کنید" : null,
                        dropdownColor: Colors.white,
                        value: selectedValue3,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue3 = newValue!;
                          });
                        },
                        items:items3.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList()),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(right: 15.0,top: 10,bottom: 5),
                    child: Text('ساعات کاری',style: TextStyle(fontFamily: 'Shabnam'),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  DropdownButtonFormField(
                        enableFeedback: false,
                        alignment: Alignment.centerRight,
                        style:  TextStyle(fontFamily: "Shabnam",color: Colors.grey.shade600,fontSize: 16),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.green, width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.green, width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) => value == null ? "یک گذینه را انتخاب کنید" : null,
                        dropdownColor: Colors.white,
                        value: selectedValue4,
                        hint: const Text('ساعت شروع کار'),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue4 = newValue!;
                          });
                        },
                        items:items4.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  DropdownButtonFormField(
                        enableFeedback: false,
                        alignment: Alignment.centerRight,
                        style:  TextStyle(fontFamily: "Shabnam",color: Colors.grey.shade600,fontSize: 16),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.green, width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.green, width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) => value == null ? "یک گذینه را انتخاب کنید" : null,
                        dropdownColor: Colors.white,
                        value: selectedValue5,
                        hint: const Text('ساعت پایان کار'),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue5 = newValue!;
                          });
                        },
                        items:items5.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList()),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 15.0,top: 10,bottom: 5),
                    child: Text('شرح شرایط ویژه',style: TextStyle(fontFamily: 'Shabnam'),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      onChanged: (value) {
                        if(value.isNotEmpty){

                        }
                        else{

                        }
                      },
                      keyboardType: TextInputType.multiline,
                      maxLength: 256,
                      maxLines: 7,
                      style:const TextStyle(fontFamily: 'Shabnam',color: Colors.black,fontWeight: FontWeight.w100),
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 2)),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2))),),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 15.0,top: 0,bottom: 5),
                    child: Text('سابقه ',style: TextStyle(fontFamily: 'Shabnam'),),
                  ),



                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  DropdownButtonFormField(
                        enableFeedback: false,
                        alignment: Alignment.centerRight,
                        style:  TextStyle(fontFamily: "Shabnam",color: Colors.grey.shade600,fontSize: 16),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.green, width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.green, width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) => value == null ? "یک گذینه را انتخاب کنید" : null,
                        dropdownColor: Colors.white,
                        value: selectedValue6,
                        hint: const Text('انتخاب'),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue6 = newValue!;
                          });
                        },
                        items:items6.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList()),
                  ),



                  const Padding(
                    padding: EdgeInsets.only(right: 15.0,top: 15,bottom: 5),
                    child: Text('وضعیت سربازی ',style: TextStyle(fontFamily: 'Shabnam'),),
                  ),



                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  DropdownButtonFormField(
                        enableFeedback: false,
                        alignment: Alignment.centerRight,
                        style:  TextStyle(fontFamily: "Shabnam",color: Colors.grey.shade600,fontSize: 16),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.green, width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.green, width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) => value == null ? "یک گذینه را انتخاب کنید" : null,
                        dropdownColor: Colors.white,
                        value: selectedValue7,
                        hint: const Text('انتخاب'),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue7 = newValue!;
                          });
                        },
                        items:items7.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList()),
                  ),
                  const SizedBox(height: 100,)
                ],),
            ),
          ),
        ),
      );
    //);
  }
}

import 'dart:io';
import 'package:adminor/AdeversitingPages/AdvertisingDetailPage.dart';
import 'package:adminor/AdeversitingPages/AdvertisingPage.dart';
import 'package:adminor/api/Functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import '../cities.dart';
import 'package:image_picker/image_picker.dart';
import '../structure.dart';
double start = 1.0;
double end = 1.0;
String nameBox='';
String phoneBox='';
String newAdmin='';
TextEditingController searchBoxController3=TextEditingController();
String priceBox='1';
String emailBox='';
String emailBox2='';
String specialCondition='';


class NewAdvertising extends StatefulWidget {
  const NewAdvertising({super.key});

  @override
  State<NewAdvertising> createState() => _NewAdvertisingState();
}

class _NewAdvertisingState extends State<NewAdvertising> {
  TextEditingController locationController2=TextEditingController();
  List<String> filteredCities=[];
  ValueNotifier<String> stateNotifier2=ValueNotifier('notAllChecked');
  var enabledCheckBox=false;
  String? selectedPlatform;
  var platformItems = [
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
  String? selectedDealType;
  var dealTypeItems = [
    'تمام وقت',
    'پاره وقت',
    'پیمان کاری',
    'کارآموزی',
    'سایر ',
  ];
  String? selectedPaymentMethod;
  var paymentMethodItems = [
    'ماهانه',
    'روزانه',
    'پورسانتی/درصدی',
    'توافقی',
  ];
  String? selectedStartTime;
  var startTimeItems = [
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
  String? selectedEndTime;
  var endTimeItems = [
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
  String? selectedHistory;
  var historyItems = [
    'کمتر از 1 سال',
    'حداقل 1 سال',
    'حداقل 2 سال',
    'حداقل 3 سال',
    'حداقل 4 سال',
    'حداقل 5 سال',
    'حداقل 6 سال',
  ];
  String? selectedStatus;
  var statusItem = [
    'اتمام یا معافیت',
    'فرقی ندارد',
  ];
  XFile? image;
  final ImagePicker picker = ImagePicker();
  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);
   if(img!=null){
     setState(() {
       image = img;
     });
   }
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('لطفا یک گذینه را انتخاب کنید',style: TextStyle(fontFamily: 'Shabnam',fontSize: 16),),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 6+5,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.image,color: Colors.blue,),
                        SizedBox(width: 5,),
                        Text('گالری',style: TextStyle(fontFamily: 'Shabnam',fontSize: 12),),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5,),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.camera,color: Colors.purple,),
                        SizedBox(width: 5,),
                        Text('دوربین',style: TextStyle(fontFamily: 'Shabnam',fontSize: 12),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
  final formkey = GlobalKey<FormState>();
  @override
  void initState() {

    start = 1.0;
    end = 1.0;
    users.isEmpty?getUsers():null;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    List<String> filteredCities=[];
    List checkedList=['تهران'];
    return Scaffold(
      body:SafeArea(
          child:
          SingleChildScrollView(
            child: Form(
              key: formkey,
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
                    myAlert();

                    },
                        child: image!=null?ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.file(
                            //to show image, you type like this.
                            File(image!.path),
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                          ),
                        ):Image.asset('assets/images/user avatar.png',width: 50,height: 50,)),
                  ),
                ],),
                  //avatar-----------------------------------------
                Container(width: MediaQuery.of(context).size.width,decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey,width: 0.1))),),
                const SizedBox(height: 15,),
                  //name field-----------------------------------------
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (value) {nameBox=value;},
                      validator: (value) {
                        if(value!.trim()==''||value.isEmpty){
                          return 'فیلد نمیتواند خالی باشد ';
                        }
                      },
                      style: const TextStyle(fontFamily: 'Shabnam'),
                      decoration: const InputDecoration(
                          errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red,width: 2)),
                          errorStyle: TextStyle(fontFamily: 'Shabnam'),
                          labelText: 'نام و نام خانوادگی',labelStyle: TextStyle(fontFamily: 'Shabnam'),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2)),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 1.5)),

                    ),),
                  ),
                  //avatar-----------------------------------------
                  //ادمین چی باشه؟ ----------------------------------
                  enabledCheckBox==true?Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      style: const TextStyle(fontFamily: 'Shabnam'),
                      validator: (value) {
                        if(value!.trim()==''||value.isEmpty){
                          return 'فیلد نمیتواند خالی باشد ';
                        }
                          },
                    onChanged: (value) {newAdmin=value;},
                    decoration: const InputDecoration(
                      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red,width: 2)),
                      errorStyle: TextStyle(fontFamily: 'Shabnam'),
                        hintText: 'اینجا بنویس',hintStyle: TextStyle(fontFamily: 'Shabnam'),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 1.5)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2))
                    ),),
                  ):
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  DropdownButtonFormField(
                        enableFeedback: false,
                        alignment: Alignment.centerRight,
                        style:  const TextStyle(fontFamily: "Shabnam",color: Colors.black,fontSize: 16),
                        decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2)),
                          errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red,width: 2)),
                          errorStyle: const TextStyle(fontFamily: 'Shabnam'),
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
                        value: selectedPlatform,
                        hint: const Text('ادمین چی هستی؟'),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedPlatform=newValue!;
                          });
                        },
                        items:enabledCheckBox==false? platformItems.map((String items) {
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
                          value: enabledCheckBox, onChanged:
                          (value) {
                          setState(() {
                            enabledCheckBox=!enabledCheckBox;
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
                    child: TextFormField(style: const TextStyle(fontFamily: 'Vazir'),
                      onChanged: (value) {emailBox=value;},
                        validator: (value) {
                          if (value.toString().isEmpty ||
                              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value.toString())) {
                            return 'یک ایمیل معتبر وارد کنید';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red,width: 2)),
                            errorStyle: TextStyle(fontFamily: 'Shabnam'),
                            hintText: 'adminor@gmail.com',hintStyle: TextStyle(fontFamily: 'Shabnam'),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 1.5)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2))
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(style: const TextStyle(fontFamily: 'Vazir'),keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value.toString())) {
                            return 'ایمیل کارفرما را به درستی وارد کنید';
                          }
                          return null;
                        },
                      onChanged:(value) =>  emailBox2=value,
                        decoration: const InputDecoration(
                            errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red,width: 2)),
                            errorStyle: TextStyle(fontFamily: 'Shabnam'),
                            labelText: 'ایمیل کارفرمای قبلی',labelStyle: TextStyle(fontFamily: 'Shabnam'),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 1.5)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2))
                    ),),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 15.0,top: 5,bottom: 5),
                    child: Text('تلفن',style: TextStyle(fontFamily: 'Shabnam'),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(style: const TextStyle(fontFamily: 'Shabnam'),keyboardType: TextInputType.phone,maxLength: 11,
                      onChanged: (value) => phoneBox=value,
                      validator: (value) {
                        if(value==null){
                          return 'تلفن را درست وارد کنید';
                        }
                        else{
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                          errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red,width: 2)),
                          errorStyle: TextStyle(fontFamily: 'Shabnam'),
                          hintText: 'مثال : 09218783322',hintStyle: TextStyle(fontFamily: 'Shabnam'),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 1.5)),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2))
                      ),),
                  ),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  const Padding(
    padding: EdgeInsets.only(right: 15.0,top: 5,bottom: 5),
    child: Text('قیمت',style: TextStyle(fontFamily: 'Shabnam'),),
  ),
   Padding(
    padding: const EdgeInsets.only(left: 15.0,top: 5,bottom: 5),
    child: Text('${end.toStringAsFixed(3)} میلیون تومان',style: const TextStyle(fontFamily: 'Shabnam'),),
  ),
],),
                  RangeSlider(
                    activeColor: Colors.green,

                    values: RangeValues(start, end),
                    onChanged: (value) {
                      setState(() {
                        priceBox=end.toString();
                        start = value.start;
                        end = value.end;
                      });
                    },
                    min: 1.0,
                    max: 10.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8,right: 8,left: 8,bottom: 0),
                    child:
                    TextFormField(
                      controller: locationController2,
                      onTap: (){
                        showDialog(context: context, builder: (context) => AlertDialog(contentPadding: const EdgeInsets.only(top:10),
                            content: SingleChildScrollView(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width:MediaQuery.of(context).size.width,
                                      child: const Padding(
                                        padding: EdgeInsets.only(bottom: 15.0,right: 25,left: 25),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            height: 60,
                                            width: MediaQuery.of(context).size.width-130,
                                            child:
                                            TextField(
                                              controller: searchBoxController3,
                                              onChanged: (value) {
                                                if(searchBoxController3.text.isEmpty){
                                                  stateNotifier2.value='nothing';
                                                }
                                                else{
                                                  stateNotifier2.value=searchBoxController3.text;
                                                }
                                              },
                                              style: const TextStyle(fontFamily: 'Vazir',color: Colors.black),
                                              textDirection: TextDirection.rtl,
                                              decoration:  InputDecoration(
                                                enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.grey,width: 1),borderRadius: BorderRadius.circular(8)),
                                                hintText: 'اینجا بنویسید',
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
                                              valueListenable: stateNotifier2,
                                              builder: (context, value, child) {
                                                if(searchBoxController3.text.isNotEmpty){
                                                  if(checkedList.length==31){
                                                    filteredCities=[];
                                                  }
                                                  else{
                                                    filteredCities=[];
                                                  }
                                                  cities.forEach((key, value) {
                                                    if(key.contains(searchBoxController3.text)){
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
                                                    filteredCities=[];
                                                    filteredCities.addAll(cities.keys);}

                                                }
                                                return StatefulBuilder(builder: (BuildContext context, StateSetter setState){
                                                  return filteredCities.isNotEmpty?
                                                  ListView.builder(itemCount: filteredCities.length>1?filteredCities.length:1, itemBuilder: (context, index) {
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
                                                                    child:
                                                                    InkWell(
                                                                      onTap: () {
                                                                        locationController2.text=filteredCities[index].toString();
                                                                        filteredCities=[];
                                                                        filteredCities.addAll(cities.keys);
                                                                        Navigator.of(context).pop();
                                                                      },
                                                                      child: Row(
                                                                        children: [
                                                                          SizedBox(width:20,child: Text(filteredCities[index].substring(0,1),style:const TextStyle(fontSize: 16, fontFamily: 'Vazir',color: Colors.lightBlue))),
                                                                          Expanded(
                                                                            child: Center(
                                                                              child: Text(filteredCities[index],style:const TextStyle(fontSize: 16, fontFamily: 'Vazir')),
                                                                            ),
                                                                          ),
                                                                          const SizedBox(width: 20,child: Icon(Icons.location_city_rounded,color: Colors.green,),)
                                                                        ],),
                                                                    )
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
                                                  }):
                                                  const Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Center(child: Text('موردی یافت نشد',style:TextStyle(fontSize: 16, fontFamily: 'Vazir',color: Colors.red))),
                                                      Icon(Icons.error,color: Colors.redAccent,),
                                                    ],
                                                  );});


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
                                          TextButton(onPressed: (){Navigator.of(context).pop();},style: ButtonStyle(minimumSize: MaterialStateProperty.all(const Size(80, 30)),backgroundColor:MaterialStateProperty.all(Colors.green),padding: MaterialStateProperty.all(const EdgeInsets.all(15))), child: const Text('تایید',style: TextStyle(color: Colors.white,fontFamily: 'Shabnam'),)),
                                          const SizedBox(width: 5,),
                                          TextButton(onPressed: (){Navigator.of(context).pop();},style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.red),padding: MaterialStateProperty.all(const EdgeInsets.all(15))), child: const Text('انصراف',style: TextStyle(color: Colors.white,fontFamily: 'Shabnam'),)),
                                          const SizedBox(width: 5,),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                              ),
                            )));
                        },style: TextStyle(fontFamily: 'Shabnam'),
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
                        style:  const TextStyle(fontFamily: "Shabnam",color: Colors.black,fontSize: 16),
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2)),
                          errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red,width: 2)),
                          errorStyle: const TextStyle(fontFamily: 'Shabnam'),
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
                        value: selectedDealType,
                        hint: const Text('انتخاب'),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedDealType = newValue!;
                          });
                        },
                        items:dealTypeItems.map((String items) {
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
                        style:  const TextStyle(fontFamily: "Shabnam",color: Colors.black,fontSize: 16),
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2)),
                          errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red,width: 2)),
                          errorStyle: const TextStyle(fontFamily: 'Shabnam'),
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
                        value: selectedPaymentMethod,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedPaymentMethod = newValue!;
                          });
                        },
                        items:paymentMethodItems.map((String items) {
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
                        style:  const TextStyle(fontFamily: "Shabana",color: Colors.black,fontSize: 16),
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2)),
                          errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red,width: 2)),
                          errorStyle: const TextStyle(fontFamily: 'Shabnam'),
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
                        value: selectedStartTime,
                        hint: const Text('ساعت شروع کار'),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedStartTime = newValue!;
                          });
                        },
                        items:startTimeItems.map((String items) {
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
                        style:  const TextStyle(fontFamily: "Shabnam",color: Colors.black,fontSize: 16),
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2)),
                          errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red,width: 2)),
                          errorStyle: const TextStyle(fontFamily: 'Shabnam'),
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
                        value: selectedEndTime,
                        hint: const Text('ساعت پایان کار'),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedEndTime = newValue!;
                          });
                        },
                        items:endTimeItems.map((String items) {
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
                      onChanged: (value) {specialCondition=value;},
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
                        style:  const TextStyle(fontFamily: "Shabnam",color: Colors.black,fontSize: 16),
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2)),
                          errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red,width: 2)),
                          errorStyle: const TextStyle(fontFamily: 'Shabnam'),
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
                        value: selectedHistory,
                        hint: const Text('انتخاب'),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedHistory = newValue!;
                          });
                        },
                        items:historyItems.map((String items) {
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
                        style:  const TextStyle(fontFamily: "Shabnam",color: Colors.black,fontSize: 16),
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2)),
                          errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red,width: 2)),
                          errorStyle: const TextStyle(fontFamily: 'Shabnam'),
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
                        value: selectedStatus,
                        hint: const Text('انتخاب'),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedStatus = newValue!;
                          });
                        },
                        items:statusItem.map((String items) {
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
      floatingActionButton:SizedBox(
        width: MediaQuery.of(context).size.width-30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(heroTag:'btn1',backgroundColor: Colors.green,onPressed: (){
            if(formkey.currentState!.validate()==false){
              print('you have problem in form');
            }
            else{
              showDialog(context: context, builder: (context) =>  AlertDialog(
                  actions: [
                    TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),onPressed: (){Navigator.of(context).pop();}, child: const Text('خیر',style: TextStyle(fontFamily: 'Vazir',fontSize: 15,color: Colors.white),)),
                    TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),onPressed: (){
                      Navigator.of(context).pop();
                      addNewAdmin(nameBox,phoneBox, enabledCheckBox==true?newAdmin:selectedPlatform!, emailBox, emailBox2, priceBox.length>5?priceBox.substring(0,5):priceBox, locationController2.text, selectedDealType!, selectedPaymentMethod!, int.parse(selectedStartTime!), int.parse(selectedEndTime!), specialCondition, selectedHistory, selectedStatus,image==null?null:image!);
                      var userHolder=UserStructure(0, phoneBox, cache.read('telephone').toString(), nameBox, priceBox, enabledCheckBox==true?newAdmin:selectedPlatform!, 'https://192.168.1.106/adminor/uploads/${image==null?'useravatar.png':image!.name}', 'تهران', selectedDealType!,  selectedPaymentMethod!,  selectedStartTime.toString(), selectedEndTime.toString(), specialCondition, selectedHistory!, emailBox, emailBox2, selectedStatus!);
                      users.add(userHolder);
                      formkey.currentState!.reset();
                      setState(() {

                      });
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Advertising()));
                      setState(() {

                      });
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        shape: StadiumBorder(),
                        elevation: 0,
                        backgroundColor: Colors.green,
                        width: 300,
                        content: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text('ادمین جدید با موفقیت ایجاد شد',style: TextStyle(color: Colors.white,fontFamily: 'Shabnam'),),Icon(Icons.add,color: Colors.white,)])));},
                        child: const Text('بله',style: TextStyle(fontFamily: 'Vazir',fontSize: 15,color: Colors.white),))
                  ],
                  title:const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                    Text('آیا از افزودن ادمین مطمعن هستید؟',style: TextStyle(fontFamily: 'Vazir',fontSize: 15),),
                    Icon(Icons.error,color: Colors.blue,)],)
              ),);
            }
            },child: const Directionality(textDirection: TextDirection.rtl,child: Icon(Icons.done,color: Colors.white,))),
            FloatingActionButton(heroTag:'btn2',backgroundColor: Colors.white,onPressed: (){Navigator.of(context).pop();},child: const Directionality(textDirection: TextDirection.ltr,child: Icon(CupertinoIcons.back,color: Colors.green,))),
          ],),
      ),
      );
    //);

  }

}



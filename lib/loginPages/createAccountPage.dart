
import 'package:adminor/AdeversitingPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
/*import 'package:liquid_swipe/liquid_swipe.dart';
*/
TextEditingController nameBoxController=TextEditingController();
TextEditingController lastNameBoxController=TextEditingController();
TextEditingController ageBoxController=TextEditingController();
class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});
  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}
class _CreateAccountPageState extends State<CreateAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
      if(nameBoxController.text.isNotEmpty&&ageBoxController.text.isNotEmpty&&lastNameBoxController.text.isNotEmpty){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return const AdvertisingPage();
        },));
      }
      else if (nameBoxController.text.isEmpty){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(width:200,behavior: SnackBarBehavior.floating,content: Center(child: Text('لطفا نام را وارد کنید',style: TextStyle(fontFamily: 'Vazir'),)),backgroundColor: Colors.red,));
      }
      else if (lastNameBoxController.text.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar( const SnackBar(behavior: SnackBarBehavior.floating,width: 200,content: Center(child: Text('لطفا نام خانوادگی را وارد کنید',style: TextStyle(fontFamily: 'Vazir'),)),backgroundColor: Colors.red,));
      }
      else if (ageBoxController.text.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(behavior:SnackBarBehavior.floating,width: 200,content: Center(child: Text('لطفا سن را وارد کنید',style: TextStyle(fontFamily: 'Vazir'),)),backgroundColor: Colors.red,));
      }
      },
        label: const Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,textDirection:TextDirection.ltr,children: [Icon(Icons.login),SizedBox(width: 10,),Text('ورود',style: TextStyle(fontWeight: FontWeight.w900,fontFamily: 'Vazir'),)]),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child:
            Column(
              children: [
                Expanded(
                  child: Stack(children:[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset('assets/images/splash-bottom-page-image.png'),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset(
                          'assets/images/splash-bottom-page-image-sun.png',height: MediaQuery.of(context).size.height/3,
                          opacity: const AlwaysStoppedAnimation(.3),
                        ),
                      ],
                    ),
                    mainBackContainer(context),
                  ] ),
                ),
              ],
            ),
      ),
    );
  }
}
//main back container---------->
Widget mainBackContainer(context){
  return Container(
      padding:const EdgeInsets.all(10),
      decoration:const BoxDecoration(
          borderRadius:
          BorderRadius.all(Radius.circular(35))),
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          nameBox(context),
          const SizedBox(height: 10),
          lastnameBox(context),
          const SizedBox(height: 10),
          ageBox(context),
          const SizedBox(height: 70),
        ],
      ),
  );
}
//text boxes------------>
//text box name
Widget nameBox(context){
  return Container(
    height: MediaQuery.of(context).size.height/10,
    padding: const EdgeInsets.all(8.0),
    alignment: Alignment.centerRight,
    decoration: BoxDecoration(
      color: Colors.green.withOpacity(0.9),
      boxShadow: const [
        BoxShadow(
            color: Colors.white,
            spreadRadius: 0.2,
            blurRadius: 1),
      ],
      borderRadius: BorderRadius.circular(25),
    ),
    child: Row(
      crossAxisAlignment:CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: TextFormField(
            controller: nameBoxController,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp('[A-z]')
              )
            ],
            keyboardType: TextInputType.name,
            autofocus: false,
            style: const TextStyle(
                color: Colors.white,
                fontFamily: 'vazir'),
                cursorColor: Colors.black87,
                cursorWidth: 0,
                maxLength: 11,
                minLines: 1,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              border: InputBorder.none,
              icon: Padding(
                padding: EdgeInsets.only(left: 5.0,right: 13),
                child: Icon(
                  Icons.account_box_sharp,
                  color: Colors.white,
                ),
              ),
              hintText: "نام",
              hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
              counterText: '',
            ),
          ),
        ),
      ],
    ),
  );
}
//text box lName
Widget lastnameBox(context){
  return Container(
    height: MediaQuery.of(context).size.height/10,
    padding: const EdgeInsets.all(8.0),

    alignment: Alignment.centerRight,
    decoration: BoxDecoration(
      color: Colors.green.withOpacity(0.9),
      boxShadow: const [
        BoxShadow(
            color: Colors.white,
            spreadRadius: 0.2,
            blurRadius: 1),
      ],
      borderRadius: BorderRadius.circular(25),
    ),
    child: Row(
      crossAxisAlignment:CrossAxisAlignment.stretch,
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: TextFormField(
            controller: lastNameBoxController,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp('[A-z]'))
            ],
            keyboardType: TextInputType.name,
            autofocus: false,
            style: const TextStyle(
                color: Colors.white,
                fontFamily: 'vazir'),
            cursorColor: Colors.black87,
            cursorWidth: 0,
            maxLength: 20,
            minLines: 1,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              border: InputBorder.none,
              icon: Padding(
                padding: EdgeInsets.only(left: 5.0,right: 13),
                child: Icon(
                  Icons.supervisor_account_outlined,
                  color: Colors.white,
                ),
              ),
              hintText: "نام خانوادگی",
              hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
              counterText: '',
            ),
          ),
        ),
      ],
    ),
  );
}
//text box age
Widget ageBox(context){
  return Container(
    height: MediaQuery.of(context).size.height/10,
    padding: const EdgeInsets.all(8.0),
    alignment: Alignment.centerRight,
    decoration: BoxDecoration(
      color: Colors.green.withOpacity(0.9),
      boxShadow: const [
        BoxShadow(
            color: Colors.white,
            spreadRadius: 0.2,
            blurRadius: 1),
      ],
      borderRadius: BorderRadius.circular(25),
    ),
    child: Row(
      crossAxisAlignment:CrossAxisAlignment.stretch,
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: TextFormField(
            controller: ageBoxController,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp('[0-9]'))
            ],
            keyboardType: TextInputType.number,
            autofocus: false,
            style: const TextStyle(
                color: Colors.white,
                fontFamily: 'vazir'),
            cursorColor: Colors.black87,
            cursorWidth: 0,
            maxLength: 3,
            minLines: 1,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              border: InputBorder.none,
              icon: Padding(
                padding: EdgeInsets.only(left: 5.0,right: 13),
                child: Icon(
                  Icons.accessibility_sharp,
                  color: Colors.white,
                ),
              ),
              hintText: "سن",
              hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
              counterText: '',
            ),
          ),
        ),
      ],
    ),
  );
}

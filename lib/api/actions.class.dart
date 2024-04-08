/*
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
//import 'dart:developer' as dev;
import 'dart:convert';

class Acts{

 // static SharedPreferences? _pref;

  static const _skipStarterPage = 'skipStarterPage';
  static const _joinStatus = 'joinStatus';
  static const _userPageIndex = 'userPageIndex';
  static const _userIsLogin = 'userIsLogin';
  static const _userInfo = 'userInfo';
  static const _userID = 'userID';
  static const _userShop = 'userShop';
  static const _userFirstName = 'userFirstName';
  static const _userLastName = 'userLastName';
  static const _userCodeMeli = 'userCodeMeli';
  static const _userPhone = 'userPhone';
  static const _userWallet = 'userWallet';
  static const _url = "https://sandoqdar.ir/connections/api/";

*/
/*  static Future init() async => _pref = await SharedPreferences.getInstance();*//*


  // Use On StarterPage
  static Future setSkipStarterPage(bool status) async => _pref?.setBool(_skipStarterPage,status );
  static bool? getSkipStarterPage() => _pref?.getBool(_skipStarterPage);

  static Future setJoinStatus(bool status) async => _pref?.setBool(_joinStatus,status );
  static bool? getJoinStatus() => _pref?.getBool(_joinStatus);

  static Future setUserPageIndex(int index) async => _pref?.setInt(_userPageIndex, index);
  static int? getUserPageIndex() => _pref?.getInt(_userPageIndex);

  // User Actions
  // User Login Status
    static Future setUserLoginStatus(bool name) async => _pref?.setBool(_userIsLogin, name);
    static bool? getUserLoginStatus() => _pref?.getBool(_userIsLogin);
  // User ID
  static Future setUserID(String index) async => _pref?.setString(_userID, index);
  static String? getUserID() => _pref?.getString(_userID);
  // User Info
  static Future setUserInfo(String index) async => _pref?.setString(_userInfo, index);
  static String? getUserInfo() => _pref?.getString(_userInfo);
  // User FirstName
  static Future setUserFirstName(String index) async => _pref?.setString(_userFirstName, index);
  static String? getUserFirstName() => _pref?.getString(_userFirstName);
  // User LastName
  static Future setUserLastName(String index) async => _pref?.setString(_userLastName, index);
  static String? getUserLastName() => _pref?.getString(_userLastName);
  // User CodeMeli
  static Future setUserCodeMeli(String index) async => _pref?.setString(_userCodeMeli, index);
  static String? getUserCodeMeli() => _pref?.getString(_userCodeMeli);
  // User Phone
  static Future setUserPhone(String index) async => _pref?.setString(_userPhone, index);
  static String? getUserPhone() => _pref?.getString(_userPhone);
  // User Wallet
  static Future setUserWallet(int index) async => _pref?.setInt(_userWallet, index);
  static int? getUserWallet() => _pref?.getInt(_userWallet);
  // User Shop
  static Future setUserShop(int index) async => _pref?.setInt(_userShop, index);
  static int? getUserShop() => _pref?.getInt(_userShop);

  static Future userLogOut() async {
    _pref?.remove(_userInfo);
    _pref?.remove(_userIsLogin);
    _pref?.remove(_userFirstName);
    _pref?.remove(_userLastName);
    _pref?.remove(_userCodeMeli);
    _pref?.remove(_userPhone);
    _pref?.remove(_userWallet);
    _pref?.remove(_userShop);
  }

  static Future getAndroidAppLastVersion() async{

    try{

      var response = await http.post(
          Uri.parse(_url + 'userActions.php'),
          body: {
            'key': '123456',
            'action': 'getAndroidAppLastVersion',
          });


      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;

    }catch(err){
      return {"status":false};
    }

  }

  static Future loginUser(String phone) async{

    try{
      var response = await http.post(
          Uri.parse(_url + 'userActions.php'),
          body: {
            'key': '123456',
            'action': 'userLogin',
            'phone':phone
          });

      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;
    }catch(err){
      return {"status":false};
    }

  }

  static Future updateUserDefaultShopID(String userID,String shopID) async{

    try{

      var response = await http.post(
          Uri.parse(_url + 'userActions.php'),
          body: {
            'key': '123456',
              'action': 'updateUserDefaultShopID',
            'userID': userID,
            'shopID':shopID,
          });


      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;

    }catch(err){
      return {"status":false};
    }

  }

  static Future submitLoginCode(String phone,String code) async{

    try{
      var response = await http.post(
          Uri.parse(_url + 'userActions.php'),
          body: {
            'key': '123456',
            'action': 'submitLoginCode',
            'phone':phone,
            'code':code
          });


      final decodeResponse = await jsonDecode(response.body);

      if (decodeResponse['status']) {

        final user = jsonDecode(decodeResponse['result']);
        if (int.parse(user['user_confirm']) == 1) {

          final userInfo = decodeResponse['result'];

          Acts.setUserInfo(userInfo);
          Acts.setUserLoginStatus(true);
          Acts.setUserID(user['id']);
          Acts.setUserFirstName(user['first_name']);
          Acts.setUserLastName(user['last_name']);
          Acts.setUserCodeMeli(user['code_meli']);
          Acts.setUserPhone(user['phone']);
          Acts.setUserWallet(int.parse(user['wallet']));
          Acts.setUserShop(int.parse(user['shop_id']));

        }

      }
      return decodeResponse;

    }catch(err){
      return {"status":false};
    }

  }

  static Future submitUserInfo(String firstName,String lastName,String codeMeli,String phone) async{

    try{

      var response = await http.post(
          Uri.parse(_url + 'userActions.php'),
          body: {
            'key': '123456',
            'action': 'submitUserInfo',
            'first_name' : firstName,
            'last_name' : lastName,
            'code_meli' : codeMeli,
            'phone':phone,
          });

      final decodeResponse = await jsonDecode(response.body);
      if (decodeResponse['status']) {
        final user = jsonDecode(decodeResponse['result']);
        final userInfo = decodeResponse['result'];

        Acts.setUserInfo(userInfo);
        Acts.setUserLoginStatus(true);
        Acts.setUserID(user['id']);
        Acts.setUserFirstName(user['first_name']);
        Acts.setUserLastName(user['last_name']);
        Acts.setUserCodeMeli(user['code_meli']);
        Acts.setUserPhone(user['phone']);
        Acts.setUserWallet(int.parse(user['wallet']));
        Acts.setUserShop(int.parse(user['shop_id']));

      }
      return decodeResponse;
    }catch(err){
      return {"status":false};
    }

  }

  static Future getUserShopCount(String userID) async{

    try{
      var response = await http.post(
          Uri.parse(_url + 'userActions.php'),
          body: {
            'key': '123456',
            'action': 'getUserShopCount',
            'userID':userID
          });

      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;
    }catch(err){
      return {"status":false};
    }

  }
  // End User Actions

  // Start Shop Actions
  static Future addFirstShop(String name,String category,String imagePath,bool useDefault) async{

    try{
      String userID = Acts.getUserID() ?? '';

      if(useDefault){
        var response = await http.post(
            Uri.parse(_url + 'shopActions.php'),
            body: {
              'key': '654321',
              'action': 'addFirstShop',
              'userID':userID,
              'shop_name':name,
              'shop_category':category,
              'use_default':useDefault.toString(),

            });

        final decodeResponse = jsonDecode(response.body);

        if(decodeResponse['status'] == true){
          Acts.setUserShop(int.parse(decodeResponse['result']));
        }
        return decodeResponse['status'];

      }else{
        final uri = Uri.parse(_url + 'shopActions.php');
        var req = http.MultipartRequest('POST', uri);

        req.fields['key'] = '654321';
        req.fields['action'] = 'addFirstShop';
        req.fields['userID'] = userID;
        req.fields['shop_name'] = name;
        req.fields['shop_category'] = category;
        req.fields['use_default'] = 'false';

        var pic = await http.MultipartFile.fromPath("image", imagePath);
        req.files.add(pic);
        var response = await req.send();

        if (response.statusCode == 200) {
        return true;
        }else{
          return false;
        }
      }


    }catch(err){

      return {"status":false};
    }

  }

  static Future addFirstShopWithSubscription(String name,String category,String imagePath,bool useDefault) async{

    try{
      String userID = Acts.getUserID() ?? '';

      if(useDefault){
        var response = await http.post(
            Uri.parse(_url + 'shopActions.php'),
            body: {
              'key': '654321',
                'action': 'addFirstShopWithSubscription',
              'userID':userID,
              'shop_name':name,
              'shop_category':category,
              'use_default':useDefault.toString(),

            });

        final decodeResponse = jsonDecode(response.body);

        if(decodeResponse['status'] == true){
          Acts.setUserShop(int.parse(decodeResponse['result']));
        }
        return decodeResponse['status'];

      }else{
        final uri = Uri.parse(_url + 'shopActions.php');
        var req = http.MultipartRequest('POST', uri);

        req.fields['key'] = '654321';
        req.fields['action'] = 'addFirstShopWithSubscription';
        req.fields['userID'] = userID;
        req.fields['shop_name'] = name;
        req.fields['shop_category'] = category;
        req.fields['use_default'] = 'false';

        var pic = await http.MultipartFile.fromPath("image", imagePath);
        req.files.add(pic);
        var response = await req.send();

        if (response.statusCode == 200) {
          return true;
        }else{
          return false;
        }
      }


    }catch(err){

      return {"status":false};
    }

  }

  static Future getShopInfo(String shopID) async{

    try{
      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'getShopInfo',
            'shopID':shopID
          });

      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;
    }catch(err){
      return {"status":false};
    }

  }

  static Future getShopPageInfo(String shopID) async{

    try{
      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'getShopPageInfo',
            'shopID':shopID
          });

      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;
    }catch(err){

      return {"status":false};
    }

  }

  static Future updateShopTitle(String shopID,String text) async{

    try{
      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'updateShopTitle',
            'text': text,
            'shopID':shopID
          });

      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;
    }catch(err){
      return {"status":false};
    }

  }

  static Future updateShopCategory(String shopID,String text) async{

    try{
      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'updateShopCategory',
            'text': text,
            'shopID':shopID
          });

      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;
    }catch(err){
      print(err);
      return {"status":false};
    }

  }

  static Future updateShopCardNumber(String shopID,String text) async{

    try{
      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'updateShopCardNumber',
            'text': text,
            'shopID':shopID
          });

      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;
    }catch(err){
      return {"status":false};
    }

  }

  static Future updateShopCardName(String shopID,String text) async{

    try{
      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'updateShopCardName',
            'text': text,
            'shopID':shopID
          });

      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;
    }catch(err){
      return {"status":false};
    }

  }

  static Future updateShopPhone(String shopID,String text) async{

    try{
      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'updateShopPhone',
            'text': text,
            'shopID':shopID
          });

      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;
    }catch(err){
      return {"status":false};
    }

  }

  static Future updateShopHomePhone(String shopID,String text) async{

    try{
      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'updateShopHomePhone',
            'text': text,
            'shopID':shopID
          });

      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;
    }catch(err){
      return {"status":false};
    }

  }

  static Future updateShopIdPayToken(String shopID,String text) async{

    try{
      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'updateShopIdPayToken',
            'text': text,
            'shopID':shopID
          });

      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;
    }catch(err){
      return {"status":false};
    }

  }

  static Future updateShopZarinPalToken(String shopID,String text) async{

    try{
      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'updateShopZarinPalToken',
            'text': text,
            'shopID':shopID
          });

      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;
    }catch(err){
      return {"status":false};
    }

  }

  static Future updateShopZarinPal(String shopID,String text) async{

    try{
      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'updateShopZarinPal',
            'text': text,
            'shopID':shopID
          });

      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;
    }catch(err){
      return {"status":false};
    }

  }

  static Future getShops(String userID) async{

    try{
      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'getShops',
            'userID':userID
          });

      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;
    }catch(err){
      return {"status":false};
    }

  }

  static Future addCommodity(String title,String category,String image,String tax,String location,String unit,int amount,int priceBuy,int price,int shopID,bool useDefault) async{

    try{
      String userID = Acts.getUserID() ?? '0';
      if(useDefault) {

        var response = await http.post(
            Uri.parse(_url + 'shopActions.php'),
            body: {
              'key': '654321',
              'action': 'addCommodity',
              'title': title,
              'category': category,
              'image': image,
              'tax': tax,
              'location': location,
              'unit': unit,
              'amount': amount.toString(),
              'priceBuy': priceBuy.toString(),
              'price': price.toString(),
              'shopID': shopID.toString(),
              'userID': userID,
              'use_default': 'true'
            });


        final decodeResponse = jsonDecode(response.body);
        return decodeResponse['status'];
      }else{

        final uri = Uri.parse(_url + 'shopActions.php');
        var req = http.MultipartRequest('POST', uri);

        req.fields['key'] = '654321';
        req.fields['action'] = 'addCommodity';
        req.fields['title'] = title;
        req.fields['category'] = category;
        req.fields['image'] = image;
        req.fields['tax'] = tax;
        req.fields['location'] = location;
        req.fields['unit'] = unit;
        req.fields['amount'] = amount.toString();
        req.fields['price'] = price.toString();
        req.fields['priceBuy'] = priceBuy.toString();
        req.fields['shopID'] = shopID.toString();
        req.fields['userID'] = userID;

        req.fields['use_default'] = 'false';

        var pic = await http.MultipartFile.fromPath("image", image);
        req.files.add(pic);
        var response = await req.send();


        if (response.statusCode == 200) {
          return true;
        }else{
          return false;
        }

      }

    }catch(err){
      return {"status":false};
    }

  }

  static Future addFactor(String customerName,String customerPhone,String customerAddress,List<dynamic> commodities,int price,String payType,int payed,payPart,payPartProfit,int shopID,String description,int discount) async{

    try{

      String userID = Acts.getUserID() ?? '0';

      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'addFactorQ',
            'customerName': customerName,
            'customerPhone': customerPhone,
            'customerAddress': customerAddress,
            'commodities': jsonEncode(commodities),
            'description': description,
            'price': price.toString(),
            'discount': discount.toString(),
            'payType': payType,
            'payed': payed.toString(),
            'pay_part': payPart.toString(),
            'pay_part_profit': payPartProfit.toString(),
            'shopID': shopID.toString(),
            'userID': userID.toString(),
          });


      final decodeResponse = jsonDecode(response.body);

      return decodeResponse['status'];

    }catch(err){

      return {"status":false};
    }

  }

  static Future getAllShopCommodities(int shopID) async{

    try{
      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'getAllShopCommodities',
            'shopID':shopID
          });


      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;

    }catch(err){
      return {"status":false};
    }

  }

  static Future getAllShopCommoditiesWithSort(int shopID,String cond,String sort) async{

    try{

      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'getAllShopCommoditiesWithSort',
            'shopID':shopID.toString(),
            'cond':cond,
            'sort':sort
          });

      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;

    }catch(err){
      return {"status":false};
    }

  }

  static Future getShopCommodities(String text,int shopID,String cond,String sort) async{

    try{

      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'getShopCommodities',
            'text':text,
            'shopID':shopID.toString(),
            'cond':cond,
            'sort':sort
          });


      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;

    }catch(err){
      return {"status":false};
    }

  }

  static Future increaseCommodityAmount(String id) async{

    try{

      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'increaseCommodityAmount',
            'id':id,
          });


      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;

    }catch(err){
      return {"status":false};
    }

  }

  static Future decreaseCommodityAmount(String id) async{

    try{

      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'decreaseCommodityAmount',
            'id':id,
          });

      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;

    }catch(err){
      return {"status":false};
    }

  }

  static Future getSaleHistory(int shopID,String cond,String sort) async{

    try{

      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'getSaleHistory',
            'shopID':shopID.toString(),
            'cond':cond,
            'sort':sort
          });

      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;

    }catch(err){
      return {"status":false};
    }

  }

  static Future getShopFactors(String text,int shopID,String cond,String sort) async{

    try{

      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'getShopFactors',
            'text':text,
            'shopID':shopID.toString(),
            'cond':cond,
            'sort':sort
          });

      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;

    }catch(err){
      return {"status":false};
    }

  }

  static Future getFactor(String factorID) async{

    try{

      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'getFactor',
            'factorID':factorID,
          });


      final decodeResponse = jsonDecode(response.body);

      return decodeResponse;

    }catch(err){
      return {"status":false};
    }

  }

  static Future getCommodity(String id) async{

    try{

      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'getCommodity',
            'id':id,
          });

      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;

    }catch(err){
      return {"status":false};
    }

  }

  static Future deleteCommodity(String id) async{

    try{

      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'deleteCommodity',
            'id':id,
          });

      final decodeResponse = jsonDecode(response.body);

      return decodeResponse;

    }catch(err){
      return {"status":false};
    }

  }


  static Future updateFactorRemainingPay(String factorID,String shopID,String price) async{

    try{

      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'updateFactorRemainingPay',
            'shopID':shopID,
            'factorID':factorID,
            'price':price,
          });

      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;

    }catch(err){
      return {"status":false};
    }

  }

  static Future buyFromBazzar(String userID,String shopID,String orderID,String month) async{

    try{

      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'buyFromBazzar',
            'user_id':userID,
            'shop_id':shopID,
            'order_id':orderID,
            'month':month,
          });

      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;

    }catch(err){
      return {"status":false};
    }

  }

  static Future buyFromMyket(String userID,String shopID,String orderID,String month) async{

    try{

      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'buyFromMyket',
            'user_id':userID,
            'shop_id':shopID,
            'order_id':orderID,
            'month':month,
          });

      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;

    }catch(err){
      return {"status":false};
    }

  }

  static Future updateCommodityInfo(String id,String title,String category,String location,String tax) async{

    try{

      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'updateCommodityInfo',
            'id':id,
            'title':title,
            'category':category,
            'location':location,
            'tax':tax,
          });

      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;

    }catch(err){
      return {"status":false};
    }

  }

  static Future updateCommodityPrice(String id,String priceBuy,String price) async{

    try{

      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'updateCommodityPrice',
            'id':id,
            'priceBuy':priceBuy,
            'price':price,
          });

      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;

    }catch(err){
      return {"status":false};
    }

  }

  static Future updateCommodityImage(String id,String shopID,String image) async{

    try{

      final uri = Uri.parse(_url + 'shopActions.php');
      var req = http.MultipartRequest('POST', uri);

      req.fields['key'] = '654321';
      req.fields['action'] = 'updateCommodityImage';
      req.fields['id'] = id;
      req.fields['shopID'] = shopID;

      var pic = await http.MultipartFile.fromPath("image", image);
      req.files.add(pic);
      var response = await req.send();


      if (response.statusCode == 200) {
        return true;
      }else{
        return false;
      }

    }catch(err){
      return {"status":false};
    }

  }

  static Future sendFactorForCustomerSms(String factorID) async{

    try{

      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'sendFactorForCustomerSms',
            'factorID':factorID,
          });

      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;

    }catch(err){
      return {"status":false};
    }

  }

  static Future deleteFactor(String factorID) async{

    try{

      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'deleteFactor',
            'factorID':factorID,
          });

      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;

    }catch(err){
      return {"status":false};
    }

  }

  static Future payFactorQestSubmite(String qestID) async{

    try{

      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'payFactorQestSubmite',
            'qestID':qestID,
          });

      final decodeResponse = jsonDecode(response.body);

      return decodeResponse;

    }catch(err){
      return {"status":false};
    }

  }

  static Future payFactorAllQestSubmite(String factorID) async{

    try{

      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'payFactorAllQestSubmite',
            'factorID':factorID,
          });

      final decodeResponse = jsonDecode(response.body);

      return decodeResponse;

    }catch(err){
      return {"status":false};
    }

  }

  static Future searchInCommodities(String name) async{

    try{
      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'searchInCommodities',
            'name':name
          });


      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;

    }catch(err){
      return {"status":false};
    }

  }

  static Future searchInShopCommodities(String name,String shopID) async{

    try{
      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'searchInShopCommodities',
            'name':name,
            'shopID' : shopID
          });


      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;

    }catch(err){
      return {"status":false};
    }

  }

  static Future searchInShopCommoditiesAmount(String name,String shopID) async{

    try{
      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'searchInShopCommoditiesAmount',
            'name':name,
            'shopID' : shopID
          });


      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;

    }catch(err){
      return {"status":false};
    }

  }

  static Future searchInCustomers(String name,String shopID) async{

    try{
      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'searchInCustomers',
            'name':name,
            'shopID' : shopID
          });

      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;

    }catch(err){
      return {"status":false};
    }

  }

  static Future getFactorCount(int shopID) async{

    try{
      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'getFactorCount',
            'shopID':shopID.toString()
          });


      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;

    }catch(err){
      return {"status":false};
    }

  }

  static Future getFactors(int shopID) async{

    try{
      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'getFactors',
            'shopID':shopID.toString()
          });


      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;

    }catch(err){
      return {"status":false};
    }

  }

  static Future getCustomerCount(int shopID) async{

    try{
      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'getCustomerCount',
            'shopID':shopID.toString()
          });


      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;

    }catch(err){
      return {"status":false};
    }

  }

  static Future buySubscription(int shopID,String time) async{

    try{

      var response = await http.post(
          Uri.parse(_url + 'shopActions.php'),
          body: {
            'key': '654321',
            'action': 'buySubscription',
            'shopID':shopID.toString(),
            'time':time
          });


      final decodeResponse = jsonDecode(response.body);
      return decodeResponse;

    }catch(err){
      return {"status":false};
    }

  }
  // End Shop Action

}*/

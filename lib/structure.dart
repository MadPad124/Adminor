List<String> name=['محمد فاقانی','محسن عباسی','هوشنگ تیموری','بهاره رهنما'];
List<String> price=['120000','360000','96000','210000'];
List<String> city=['تهران','فارس','لرستان','یزد'];
List<String> job=['ادمین اینستاگرام','ادمین سایت','ادمین ایتا','ادمین تلگرام'];
List<String> url=['assets/images/user avatar.png','assets/images/men avatar.png','assets/images/UserRandom.png','assets/images/women avatar.png'];


class UserStructure{
  int _id;
  String _phone_number;
  String _name;
  String _price;
  String _type;
  String _image;
  String _city;
  String _dealType;
  String _paymentMethod;
  int _startTime;
  int _endTime;
  String _specialConditions;
  int _history;
  String _email_1;
  String _email_2;
  int _point;
  String _status;
  UserStructure(
      this._id,
      this._phone_number,
      this._name,
      this._price,
      this._type,
      this._image,
      this._city,
      this._dealType,
      this._paymentMethod,
      this._startTime,
      this._endTime,
      this._specialConditions,
      this._history,
      this._email_1,
      this._email_2,
      this._point,
      this._status);

  int get point => _point;

  String get email_2 => _email_2;

  String get email_1 => _email_1;

  int get history => _history;

  String get specialConditions => _specialConditions;

  int get endTime => _endTime;

  int get startTime => _startTime;

  String get paymentMethod => _paymentMethod;

  String get dealType => _dealType;

  String get city => _city;

  String get image => _image;

  String get type => _type;

  String get price => _price;

  String get name => _name;

  String get phone_number => _phone_number;

  int get id => _id;

  String get status => _status;
}

class FavoriteHolder{
  final _id;
  final _phone;
  final _adminPhone;
  final _status;

  FavoriteHolder(this._id, this._phone, this._adminPhone, this._status);

  get status => _status;

  get adminPhone => _adminPhone;

  get phone => _phone;

  get id => _id;
}

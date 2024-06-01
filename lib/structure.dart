class UserStructure{
  int _id;
  String _phone_number;
  String _adminPhone;
  String _name;
  String _price;
  String _type;
  String _image;
  String _city;
  String _dealType;
  String _paymentMethod;
  String _startTime;
  String _endTime;
  String _specialConditions;
  String _history;
  String _email_1;
  String _email_2;
  String _status;
  int _score;
  UserStructure(
      this._id,
      this._phone_number,
      this._adminPhone,
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
      this._status,
      this._score
      );


  set score(int value) {
    _score = value;
  }

  String get email_2 => _email_2;

  String get email_1 => _email_1;

  String get history => _history;

  String get specialConditions => _specialConditions;

  String get endTime => _endTime;

  String get startTime => _startTime;

  String get paymentMethod => _paymentMethod;

  String get dealType => _dealType;

  String get city => _city;

  String get image => _image;

  String get type => _type;

  String get price => _price;

  String get name => _name;

  String get phone_number => _phone_number;

  String get adminPhone => _adminPhone;

  int get id => _id;

  int get score => _score;

  String get status => _status;
}

class FavoriteHolder{
  final _id;
  final _phone;
  final _adminPhone;
  final _index;


  FavoriteHolder(this._id, this._phone, this._adminPhone, this._index);

  get adminPhone => _adminPhone;

  get index => _index;

  get phone => _phone;

  get id => _id;
}

class HistoryHolder{
  int _id;
  String _tell;
  String _date;
  String _messageTitle;
  String _messageText;



  HistoryHolder(
      this._id, this._tell, this._date, this._messageTitle, this._messageText);

  String get messageText => _messageText;


  int get id => _id;

  String get messageTitle => _messageTitle;


  String get data => _date;


  String get tell => _tell;

}

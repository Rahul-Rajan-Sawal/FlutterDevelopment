class ContactModel {

  String? custCode;
  String? type;
  String? contact;

  ContactModel({
    this.custCode,
    this.type,
    this.contact,

  });

  factory ContactModel.fromMap(Map<String,dynamic>map){
    return ContactModel(
      custCode: map['CustomerCode'],
      type:map['Type'],
      contact: map['contact'],
    );
  }
}
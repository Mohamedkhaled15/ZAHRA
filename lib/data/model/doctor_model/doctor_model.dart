class DoctorModel {
  DoctorModel({
    required this.message,
    required this.data,
  });
  late final String message;
  late final List<Data> data;

  DoctorModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.photo,
    required this.doctorName,
    required this.doctorDescription,
    required this.doctorSpecialize,
    required this.doctorAddress,
    required this.doctorClinicFees,
    required this.doctorVoiceFees,
    this.createdAt,
    this.updatedAt,
  });
  late final int id;
  late final String photo;
  late final String doctorName;
  late final String doctorDescription;
  late final String doctorSpecialize;
  late final String doctorAddress;
  late final String doctorClinicFees;
  late final String doctorVoiceFees;
  late final Null createdAt;
  late final Null updatedAt;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    photo = json['photo'];
    doctorName = json['doctor_name'];
    doctorDescription = json['doctor_description'];
    doctorSpecialize = json['doctor_specialize'];
    doctorAddress = json['doctor_address'];
    doctorClinicFees = json['doctor_clinic_fees'];
    doctorVoiceFees = json['doctor_voice_fees'];
    createdAt = null;
    updatedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['photo'] = photo;
    _data['doctor_name'] = doctorName;
    _data['doctor_description'] = doctorDescription;
    _data['doctor_specialize'] = doctorSpecialize;
    _data['doctor_address'] = doctorAddress;
    _data['doctor_clinic_fees'] = doctorClinicFees;
    _data['doctor_voice_fees'] = doctorVoiceFees;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
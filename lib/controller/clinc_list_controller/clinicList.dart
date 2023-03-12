// import 'package:flutter/material.dart';

// import '../../model/models/clincList.dart';
// import '../../repository/clincList.dart';

// class ClinicListprovider extends ChangeNotifier {
//   bool isLoading = true;
//   List<ClinicList> characters = [];
//   CharacterController() {
//     fetchCharacters();
//   }

//   Future<void> fetchCharacters() async {
//     characters = await clincService().getDoctorList();
//     isLoading = false;
//     notifyListeners();
//   }
// }

import 'package:evolving_flutter/models/features_model.dart';
import 'package:evolving_flutter/providers/database_features.dart';
import 'package:flutter/material.dart';

class ExpensesProvider extends ChangeNotifier {

  List<FeaturesModel> fList = [];

  addNewFeature(String category, String color, String icon) async{

    final newFeature = FeaturesModel(

      category: category,
      color: color,
      icon: icon

    );

    final id = await DBFeatures.db.addFeature(newFeature);
    newFeature.id = id;
    fList.add(newFeature);
    notifyListeners();

  }

}


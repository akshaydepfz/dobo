import 'package:dobo/view/category/model/category_model.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  List<CategoryModel> categoryItems = [
    CategoryModel(
        icon: 'assets/icons/categories/doctor.png', title: 'General Physician'),
    CategoryModel(
        icon: 'assets/icons/categories/teeth.png', title: 'Dental Specialist'),
    CategoryModel(
        icon: 'assets/icons/categories/hair.png', title: 'Skin Specialist'),
    CategoryModel(
        icon: 'assets/icons/categories/kid.png', title: 'Children Specialist'),
    CategoryModel(
        icon: 'assets/icons/categories/stomach.png',
        title: 'Internal Medicine'),
    CategoryModel(
        icon: 'assets/icons/categories/child.png',
        title: 'Obsteric Gynecologist'),
    CategoryModel(
        icon: 'assets/icons/categories/heart.png', title: 'Cardiologist'),
    CategoryModel(
        icon: 'assets/icons/categories/eye.png', title: 'Eye Specialist'),
    CategoryModel(
        icon: 'assets/icons/categories/reproduction.png',
        title: 'Reproduction'),
    CategoryModel(
        icon: 'assets/icons/categories/brain.png', title: 'Neurologist'),
    CategoryModel(
        icon: 'assets/icons/categories/ears.png', title: 'Ear Nose Throat'),
    CategoryModel(
        icon: 'assets/icons/categories/nutrition.png', title: 'Nutritionist'),
  ];
}

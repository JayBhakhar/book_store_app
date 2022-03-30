import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final zipCodeController = TextEditingController();
  String selectedCity = 'Москва';
  final List<String> cityList = [
    'Москва',
    'Санкт-Петербург',
    'Вологда',
    'Псков',
    'Новгород',
    'Белгород',
    'Брянск',
    'Владимир',
    'Воронеж',
    'Иваново',
    'Калуга',
    'Кострома',
    'Курск',
    'Липецк',
    'Орел',
    'Рязань',
    'Смоленск',
    'Тамбов',
    'Тверь',
    'Тула',
    'Ярославль',
    'Уфа',
    'Киров',
    'Йошкар-Ола',
    'Саранск',
    'Нижний Новгород',
    'Оренбург',
    'Пенза',
    'Пермь',
    'Самара',
    'Саратов',
    'Казань',
    'Ижевск',
    'Ульяновск',
    'Чебоксары',
    'Майкоп',
    'Астрахань',
    'Волгоград',
    'Элиста',
    'Краснодар',
    'Ростов-на-Дону',
    'Курган',
    'Мурманск',
    'Петрозаводск',
    'Сыктывкар',
    'Екатеринбург',
    'Тюмень',
    'Челябинск',
    'Нальчик',
    'Черкесск',
    'Владикавказ',
    'Ставрополь',
    'Архангельск',
    'Горно-Алтайск',
    'Барнаул',
    'Кемерово',
    'Красноярск',
    'Новосибирск',
    'Омск',
    'Томск',
    'Абакан',
    'Ханты-Мансийск',
  ];

  @override
  void onClose() {
    super.onClose();
    userController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
    cityController.dispose();
    zipCodeController.dispose();
  }
}

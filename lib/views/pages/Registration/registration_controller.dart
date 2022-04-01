import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();
  final zipCodeController = TextEditingController();
  RxString selectedCity = 'Москва'.obs;
  final List<String> cityList = [
    'Москва',
    'Санкт-Петербург',
    'Абакан',
    'Архангельск',
    'Астрахань',
    'Барнаул',
    'Белгород',
    'Брянск',
    'Владикавказ',
    'Владимир',
    'Волгоград',
    'Вологда',
    'Воронеж',
    'Горно-Алтайск',
    'Екатеринбург',
    'Иваново',
    'Ижевск',
    'Йошкар-Ола',
    'Казань',
    'Калуга',
    'Кемерово',
    'Киров',
    'Кострома',
    'Краснодар',
    'Красноярск',
    'Курган',
    'Курск',
    'Липецк',
    'Майкоп',
    'Мурманск',
    'Нальчик',
    'Нижний Новгород',
    'Новгород',
    'Новосибирск',
    'Омск',
    'Орел',
    'Оренбург',
    'Пенза',
    'Пермь',
    'Петрозаводск',
    'Псков',
    'Ростов-на-Дону',
    'Рязань',
    'Самара',
    'Саранск',
    'Саратов',
    'Смоленск',
    'Ставрополь',
    'Сыктывкар',
    'Тамбов',
    'Тверь',
    'Томск',
    'Тула',
    'Тюмень',
    'Ульяновск',
    'Уфа',
    'Ханты-Мансийск',
    'Чебоксары',
    'Челябинск',
    'Черкесск',
    'Элиста',
    'Ярославль',
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
    zipCodeController.dispose();
  }
}

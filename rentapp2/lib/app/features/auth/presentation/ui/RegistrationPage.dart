import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:rentapp2/app/di/service.dart';
import 'package:rentapp2/app/features/auth/data/model/ClientClass.dart';
import 'package:rentapp2/app/features/auth/data/repository/Clients.dart';

class RegistrationPage extends StatefulWidget {
  

  RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  ClientRepository clientRepository = service();

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _passwordController = TextEditingController();


  DateTime? _birthDate;
  bool? _typeClient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Пожалуйста, введите ваш email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(12),
              ],
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
              onChanged: (value) {
                if (value.startsWith('8') || value.startsWith('7')) {
                  _phoneNumberController.text = "+7 (${value.substring(1, 4)}) ${value.substring(4, 7)}-${value.substring(7, 9)}-${value.substring(9, 12)}";
                  _phoneNumberController.selection = TextSelection.fromPosition(TextPosition(offset: value.length));
                }
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _firstNameController,
              decoration: const InputDecoration(labelText: 'Имя'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Пожалуйста, введите ваше имя';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _lastNameController,
              decoration: const InputDecoration(labelText: 'Фамилия'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Пожалуйста, введите вашу фамилию';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _middleNameController,
              decoration: const InputDecoration(labelText: 'Отчество'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Пароль'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Пожалуйста, введите ваш пароль';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Дата рождения'),
                TextButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: _birthDate ?? DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        _birthDate = pickedDate;
                      });
                    }
                  },
                  child: Text(_birthDate != null ? DateFormat('dd.MM.yyyy').format(_birthDate!) : 'Выбрать'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: <Widget>[
                const Text('Тип клиента'),
                Switch(
                  value: _typeClient ?? false,
                  onChanged: (value) {
                    setState(() {
                      _typeClient = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                
                  
                  ClientClass client = ClientClass(
                    idClient: null,
                    email: _emailController.text,
                    passwordHash: _passwordController.text,
                    firstName: _firstNameController.text,
                    phoneNumber: _phoneNumberController.text,
                    birthDate: _birthDate!,
                    typeClient: _typeClient!,
                    middleName: _middleNameController.text,
                    lastName: _lastNameController.text,
                    photo: '',
                    role: 'User',
                    registrationDate: DateTime.now()
                  );
                    // ,

                  clientRepository.postClient(client);
                  Navigator.pop(context);
                },
              
              child: const Text('Зарегистрироваться'),
            ),
          ],
        ),
      ),
    );
  }
}
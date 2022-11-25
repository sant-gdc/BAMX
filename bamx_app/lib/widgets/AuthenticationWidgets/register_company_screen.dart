import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:bamx_app/main.dart';

class RegisterCompanyScreen extends StatefulWidget {
  const RegisterCompanyScreen({super.key});

  @override
  State<RegisterCompanyScreen> createState() => _RegisterCompanyScreenState();
}

class _RegisterCompanyScreenState extends State<RegisterCompanyScreen> {
  bool _visibilityPassword = false, _visibilityConfirm = false;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final locationController = TextEditingController();
  final cityController = TextEditingController();
  final phoneController = TextEditingController();

  var databaseReference;

  @override
  void initState() {
    databaseReference = FirebaseDatabase.instance.ref().child('Admins');
    super.initState();
  }

  void _togglePassword() {
    setState(() {
      _visibilityPassword = !_visibilityPassword;
    });
  }

  void _toggleConfirm() {
    setState(() {
      _visibilityConfirm = !_visibilityConfirm;
    });
  }

  Future<void> _signIn() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    showDialog(
        context: context,
        builder: (ctx) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: emailController.text.trim());
    } on FirebaseAuthException catch (error) {
      const snackBar = SnackBar(
        content: Text('Ya existe la cuenta'),
      );
      messengerKey.currentState!
        ..removeCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
    final Map<String, dynamic> userInfo = {
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'location': locationController.text,
      'city': cityController.text,
      'phone': phoneController.text,
      'user': 'A',
    };

    databaseReference.push().set(userInfo);
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Center(
                child: Text(
                  '¡Registrate como empresa!',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                ),
                textInputAction: TextInputAction.next,
                controller: nameController,
                validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese su nombre';
                  }
                  return null;
                }),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Correo Electrónico',
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                controller: emailController,
                validator: ((value) {
                  if (value == null ||
                      value.isEmpty ||
                      !EmailValidator.validate(value)) {
                    return 'Ingrese su correo';
                  }
                  return null;
                }),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  suffixIcon: IconButton(
                    onPressed: () {
                      _togglePassword();
                    },
                    icon: Icon(
                      _visibilityPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),
                obscureText: !_visibilityPassword,
                controller: passwordController,
                textInputAction: TextInputAction.next,
                validator: ((value) {
                  if (value == null ||
                      value.length < 8 ||
                      !value.contains(RegExp(r'[0-9]')) ||
                      !value.contains(RegExp(r'[A-Z]')) ||
                      value.isEmpty) {
                    return 'Contraseña inválida';
                  }
                  return null;
                }),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Confirmar Contraseña',
                  suffixIcon: IconButton(
                    onPressed: () {
                      _toggleConfirm();
                    },
                    icon: Icon(
                      _visibilityPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),
                obscureText: !_visibilityPassword,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese la contraseña';
                  } else if (value != passwordController.text) {
                    return 'Las contraseñas no coinciden';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Ubicación',
                ),
                controller: locationController,
                validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese su ubicacion';
                  }
                  return null;
                }),
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Ciudad',
                ),
                controller: cityController,
                validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese su ciudad';
                  }
                  return null;
                }),
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Teléfono Celular',
                ),
                keyboardType: TextInputType.phone,
                controller: phoneController,
                textInputAction: TextInputAction.done,
                validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese su teléfono';
                  }
                  return null;
                }),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: _signIn,
                child: const Text(
                  'Registrarme',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

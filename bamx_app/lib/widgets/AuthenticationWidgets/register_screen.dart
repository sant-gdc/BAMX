import 'package:bamx_app/main.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _visibilityPassword = false, _visibilityConfirm = false;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final companyController = TextEditingController();
  final cityController = TextEditingController();
  final phoneController = TextEditingController();
  dynamic databaseReference;

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

  Future _signIn() async {
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
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (error) {
      var snackBar = SnackBar(
        content: Text(error.code),
      );
      messengerKey.currentState!
        ..removeCurrentSnackBar()
        ..showSnackBar(snackBar);
    }

    final Map<String, dynamic> userInfo = {
      'name': nameController.text,
      'lastName': lastNameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'institution': companyController.text,
      'city': cityController.text,
      'phone': phoneController.text,
      'points': 0,
      'events': [],
      'user': 'U',
    };
    databaseReference = FirebaseDatabase.instance
        .ref()
        .child('Users/${FirebaseAuth.instance.currentUser!.uid}');
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
                  '¡Regístrate!',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 15,
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
                  labelText: 'Apellidos',
                ),
                textInputAction: TextInputAction.next,
                controller: lastNameController,
                validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese sus apellidos';
                  }
                  return null;
                }),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Correo Electrónico',
                ),
                textInputAction: TextInputAction.next,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !EmailValidator.validate(value)) {
                    return 'Por favor ingrese un correo válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
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
                      _visibilityConfirm
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),
                textInputAction: TextInputAction.next,
                obscureText: !_visibilityConfirm,
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
                  labelText: 'Empresa/Institución',
                ),
                textInputAction: TextInputAction.next,
                controller: companyController,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Ciudad',
                ),
                textInputAction: TextInputAction.next,
                controller: cityController,
                validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese su ciudad de residencia';
                  }
                  return null;
                }),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Teléfono Celular',
                ),
                keyboardType: TextInputType.phone,
                controller: phoneController,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 15),
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

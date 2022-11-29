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
  final visionController = TextEditingController();
  final contactsController = TextEditingController();

  dynamic databaseReference;

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
      var snackBar = SnackBar(
        content: Text(error.code),
      );
      messengerKey.currentState!
        ..removeCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
    final Map<String, dynamic> userInfo = {
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'vision': visionController.text,
      'contacts': contactsController.text,
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
                  labelText: 'Vision',
                ),
                controller: visionController,
                validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese su vision';
                  }
                  return null;
                }),
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                textInputAction: TextInputAction.newline,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Contacto(s)',
                ),
                keyboardType: TextInputType.phone,
                controller: contactsController,
                textInputAction: TextInputAction.done,
                maxLines: 3,
                validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese sus contactos';
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

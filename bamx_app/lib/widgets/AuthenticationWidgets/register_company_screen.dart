import 'package:bamx_app/main.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

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
  dynamic databaseReference, userReference;

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
      'email': emailController.text,
      'vision': visionController.text,
      'contacts': contactsController.text,
    };
    final Map<String, dynamic> userData = {
      'name': nameController.text,
      'email': emailController.text,
      'user': 'A',
    };
    databaseReference = FirebaseDatabase.instance
        .ref()
        .child('Admins/${FirebaseAuth.instance.currentUser!.uid}');
    databaseReference.push().set(userInfo);
    userReference = FirebaseDatabase.instance
        .ref()
        .child('Users/${FirebaseAuth.instance.currentUser!.uid}');
    userReference.push().set(userData);
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
                  '??Reg??strate como empresa!',
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
                  labelText: 'Correo Electr??nico',
                ),
                textInputAction: TextInputAction.next,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !EmailValidator.validate(value)) {
                    return 'Por favor ingrese un correo v??lido';
                  }
                  return null;
                },
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Contrase??a',
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
                    return 'Contrase??a inv??lida';
                  }
                  return null;
                }),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Confirmar Contrase??a',
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
                    return 'Ingrese la contrase??a';
                  } else if (value != passwordController.text) {
                    return 'Las contrase??as no coinciden';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Visi??n',
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                controller: visionController,
                validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese su visi??n';
                  }
                  return null;
                }),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Contacto(s)',
                ),
                textInputAction: TextInputAction.next,
                controller: contactsController,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese sus formas de contacto';
                  }
                  return null;
                }),
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

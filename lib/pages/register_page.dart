import 'package:allesc/providers/login_form_provider.dart';
import 'package:allesc/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Registrar una cuenta'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Ingrese sus datos',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              ChangeNotifierProvider(
                create: (_) => LoginFormProvider(),
                child: const RegisterForm(),
              ),
              const SizedBox(height: 50),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'login');
                },
                child: const Text('Ya tengo una cuenta'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Form(
      key: loginForm.formKey,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email',
              icon: Icon(Icons.alternate_email_sharp),
            ),
            onChanged: (value) => loginForm.email = value,
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

              RegExp regExp = RegExp(pattern);

              return regExp.hasMatch(value ?? '') ? null : 'No es un email';
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Contraseña',
              icon: Icon(Icons.lock_sharp),
            ),
            onChanged: (value) => loginForm.password = value,
            validator: (value2) {
              return (value2 != null && value2.length >= 6)
                  ? null
                  : 'La contraseña debe tener al menos 6 caracteres';
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 42),
            )),
            // Cuando loginForm esta cargando desactivamos boton
            onPressed: loginForm.isLoading
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    final authService =
                        Provider.of<AuthService>(context, listen: false);

                    // Lógica para procesar el inicio de sesión
                    if (!loginForm.isValidForm()) return;

                    loginForm.isLoading = true;

                    final String? mensajeError = await authService.crearUsuario(
                        loginForm.email, loginForm.password);

                    if (mensajeError == null) {
                      Navigator.pushReplacementNamed(context, 'scoreboard');
                    } else {
                      NotificacionesService.mostrarSnackbar(mensajeError);
                      loginForm.isLoading = false;
                    }
                  },
            child: Text(loginForm.isLoading ? 'Accediendo...' : 'Crear cuenta'),
          ),
        ],
      ),
    );
  }
}

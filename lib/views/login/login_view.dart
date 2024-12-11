import 'package:dsw_51706/utils/my_colors.dart';
import 'package:dsw_51706/utils/my_images.dart';
import 'package:dsw_51706/views/register_view/register_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>(); // Klucz formularza
  final _emailController = TextEditingController(); // Kontroler pola e-mail

  String? _validateEmail(String? value) {
    const emailPattern =
        r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+$'; // Prosty regex do walidacji e-maila
    final regex = RegExp(emailPattern);
    if (value == null || value.isEmpty) {
      return 'Please enter your email.';
    } else if (!regex.hasMatch(value)) {
      return 'Not a valid email.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Ustawienie białego tła
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey, // Powiązanie formularza z kluczem
          child: ListView(
            children: [
              const SizedBox(height: 20), // Przestrzeń na górze
              Image.asset(
                MyImages.logo,
                width: 129, // Zmniejszona szerokość
                height: 129, // Opcjonalnie, ustaw stałą wysokość
              ),
              const SizedBox(height: 20),
              // Tekst "Sign in" wyrównany do lewej strony
              const Padding(
                padding: EdgeInsets.only(left: 19.0), // Wyrównanie do lewej
                child: Text(
                  'Sign in',
                  style: TextStyle(
                    fontWeight: FontWeight.w700, // Grubość czcionki
                    fontSize: 30, // Rozmiar czcionki
                    height: 36.31 / 30, // Line height
                    color: Color(0xFF471AA0), // Fioletowy kolor
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Pole "Email or User Name"
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email or User Name',
                  prefixIcon: Icon(Icons.person_outline,
                      color: MyColors.purpleBoxpurplejasnyfiolet2),
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                        color: MyColors.purpleBoxpurplejasnyfiolet2, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                        color: MyColors.purpleBoxpurplejasnyfiolet2, width: 2.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide:
                    const BorderSide(color: Colors.red, width: 2.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide:
                    const BorderSide(color: Colors.red, width: 2.0),
                  ),
                ),
                validator: _validateEmail, // Dodanie walidatora
              ),
              const SizedBox(height: 16),
              // Pole "Password"
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock_outline,
                      color: MyColors.purpleBoxpurplejasnyfiolet2),
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                        color: MyColors.purpleBoxpurplejasnyfiolet2, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                        color: MyColors.purpleBoxpurplejasnyfiolet2, width: 2.0),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Akcja dla "Forget Password?"
                  },
                  child: Text(
                    'Forget Password ?',
                    style: TextStyle(color: MyColors.purpleBlackColor),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Przycisk "Sign In"
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Formularz poprawny, wykonaj akcję
                    print('Form is valid');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.boxthemecolor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  minimumSize: const Size(390, 50),
                ),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              // Tekst "Don't have an account? Sign Up"
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Don’t have an account ? ',
                    style: TextStyle(
                      color: MyColors.purpleBlackColor, // Kolor podstawowego tekstu
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.9, // Line height ustawione na 1.9
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          color: MyColors.purpleBlackColor, // Kolor dla "Sign Up"
                          fontWeight: FontWeight.w600, // Pogrubienie
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Przejście do ekranu rejestracji
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterView()),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

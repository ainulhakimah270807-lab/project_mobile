
import 'package:flutter/material.dart';
import 'app_navbar.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();

  bool lihatPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),

            child: Form(
              key: formKey,

              child: Column(
                children: [
                  // ICON LOGIN
                  Container(
                    padding: const EdgeInsets.all(22),

                    decoration: BoxDecoration(
                      color: Colors.purple.shade100,
                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      Icons.lock_person,
                      size: 65,
                      color: Colors.purple,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Silakan login untuk melanjutkan",
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 30),

                  // USERNAME
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Username",
                      hintText: "Masukkan username",
                      prefixIcon: Icon(Icons.person_outline),
                    ),

                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Username wajib diisi";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // PASSWORD
                  TextFormField(
                    obscureText: !lihatPassword,

                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Masukkan password",
                      prefixIcon: const Icon(Icons.lock_outline),

                      suffixIcon: IconButton(
                        icon: Icon(
                          lihatPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            lihatPassword = !lihatPassword;
                          });
                        },
                      ),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password wajib diisi";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 30),

                  // BUTTON LOGIN
                  SizedBox(
                    width: double.infinity,
                    height: 55,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        foregroundColor: Colors.white,
                      ),

                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Form valid. Login belum terhubung ke database.",
                              ),
                            ),
                          );
                        }
                      },

                      child: const Text(
                        "LOGIN",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Belum punya akun?"),

                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/register");
                        },
                        child: const Text("Daftar"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      bottomNavigationBar: const AppNavBar(
        selectedIndex: 1,
      ),
    );
  }
}

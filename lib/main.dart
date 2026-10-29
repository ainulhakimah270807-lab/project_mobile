
import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';
import 'profile.dart';
import 'app_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Belajar Flutter",

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
        ),
        scaffoldBackgroundColor: const Color(0xFFF8F5FC),

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: const EdgeInsets.all(16),
        ),
      ),

      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "/login": (context) => const Login(),
        "/register": (context) => const Register(),
        "/profile": (context) => const Profile(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Utama"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // BANNER SELAMAT DATANG
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),

                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Colors.purple,
                        Colors.pinkAccent,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.waving_hand,
                        color: Colors.white,
                        size: 35,
                      ),

                      SizedBox(height: 15),

                      Text(
                        "Selamat Datang!",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(height: 8),

                      Text(
                        "Ayo belajar membuat aplikasi Flutter yang menarik.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  "Jelajahi Menu",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                menuCard(
                  context,
                  "Register",
                  "Daftarkan akun baru",
                  Icons.person_add_alt_1,
                  "/register",
                ),

                menuCard(
                  context,
                  "Login",
                  "Masuk ke akun kamu",
                  Icons.login,
                  "/login",
                ),

                menuCard(
                  context,
                  "Profile",
                  "Lihat informasi profil",
                  Icons.person,
                  "/profile",
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: const AppNavBar(
        selectedIndex: 0,
      ),
    );
  }

  Widget menuCard(
    BuildContext context,
    String judul,
    String deskripsi,
    IconData icon,
    String halaman,
  ) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 1,

      child: ListTile(
        contentPadding: const EdgeInsets.all(18),

        leading: CircleAvatar(
          backgroundColor: Colors.purple.shade50,
          child: Icon(
            icon,
            color: Colors.purple,
          ),
        ),

        title: Text(
          judul,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Text(deskripsi),

        trailing: const Icon(Icons.arrow_forward_ios, size: 17),

        onTap: () {
          Navigator.pushNamed(context, halaman);
        },
      ),
    );
  }
}

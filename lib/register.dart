import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final dateController = TextEditingController(); // Controller untuk Tanggal Lahir

  bool lihatPassword = false;

  @override
  void dispose() {
    passwordController.dispose();
    dateController.dispose();
    super.dispose();
  }

  // Fungsi untuk menampilkan date picker
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Icon(
                    Icons.person_add_alt_1,
                    size: 70,
                    color: Colors.purple,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Buat Akun Baru",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Lengkapi informasi berikut",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 30),

                  // FULL NAME
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Nama Lengkap",
                      hintText: "Masukkan nama lengkap",
                      prefixIcon: Icon(Icons.badge_outlined),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Nama wajib diisi";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // USERNAME
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Username",
                      hintText: "Buat username",
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Username wajib diisi";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // EMAIL (Keyboard otomatis memunculkan @ dan .com)
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      hintText: "contoh@email.com",
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Email wajib diisi";
                      }
                      if (!value.contains('@') || !value.contains('.')) {
                        return "Format email tidak valid";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // TANGGAL LAHIR
                  TextFormField(
                    controller: dateController,
                    readOnly: true,
                    onTap: () => _selectDate(context),
                    decoration: const InputDecoration(
                      labelText: "Tanggal Lahir",
                      hintText: "Pilih tanggal lahir",
                      prefixIcon: Icon(Icons.calendar_today_outlined),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Tanggal lahir wajib diisi";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // JENIS KELAMIN
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: "Jenis Kelamin",
                      prefixIcon: Icon(Icons.male_outlined),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: "Laki-laki",
                        child: Text("Laki-laki"),
                      ),
                      DropdownMenuItem(
                        value: "Perempuan",
                        child: Text("Perempuan"),
                      ),
                    ],
                    onChanged: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Jenis kelamin wajib diisi";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // ALAMAT
                  TextFormField(
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: "Alamat",
                      hintText: "Masukkan alamat",
                      prefixIcon: Icon(Icons.location_on_outlined),
                      alignLabelWithHint: true,
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Alamat wajib diisi";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // NO HP (Keyboard otomatis angka)
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: "No Handphone",
                      hintText: "08xxxxxxxxxx",
                      prefixIcon: Icon(Icons.phone_android),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Nomor HP wajib diisi";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // PASSWORD
                  TextFormField(
                    controller: passwordController,
                    obscureText: !lihatPassword,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Buat password",
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
                      if (value == null || value.length < 6) {
                        return "Password minimal 6 karakter";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // KONFIRMASI PASSWORD
                  TextFormField(
                    obscureText: !lihatPassword,
                    decoration: const InputDecoration(
                      labelText: "Konfirmasi Password",
                      hintText: "Ulangi password",
                      prefixIcon: Icon(Icons.verified_user_outlined),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Konfirmasi password wajib diisi";
                      }
                      if (value != passwordController.text) {
                        return "Password tidak sama";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),

                  // BUTTON REGISTER
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
                                "Form valid. Data belum disimpan ke database.",
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        "DAFTAR SEKARANG",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        "/login",
                      );
                    },
                    child: const Text("Sudah punya akun? Login"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
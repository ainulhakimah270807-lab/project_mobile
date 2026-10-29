
import 'package:flutter/material.dart';
import 'app_navbar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isTablet = constraints.maxWidth >= 840;

          // TAMPILAN TABLET
          if (isTablet) {
            return Row(
              children: [
                Expanded(
                  flex: 4,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: buildBiodata(),
                  ),
                ),

                const VerticalDivider(width: 1),

                Expanded(
                  flex: 6,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: buildKonten(true),
                  ),
                ),
              ],
            );
          }

          // TAMPILAN HP
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),

            child: Column(
              children: [
                buildBiodata(),

                const SizedBox(height: 24),

                buildKonten(false),
              ],
            ),
          );
        },
      ),

      bottomNavigationBar: const AppNavBar(
        selectedIndex: 2,
      ),
    );
  }

  // BIODATA
  Widget buildBiodata() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),

      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Colors.purple,
            Colors.pinkAccent,
          ],
        ),
        borderRadius: BorderRadius.circular(22),
      ),

      child: Column(
        children: [
          // FOTO KOTAK DENGAN SUDUT MELENGKUNG
          ClipRRect(
            borderRadius: BorderRadius.circular(20),

            child: Image.asset(
              "assets/images/misua.jpg",
              width: 125,
              height: 125,
              fit: BoxFit.cover,

              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 125,
                  height: 125,
                  color: Colors.white24,
                  child: const Icon(
                    Icons.person,
                    size: 75,
                    color: Colors.white,
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 18),

          const Text(
            "Ainul Hakimah",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            "Teknik Informatika",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 8),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 8,
            ),

            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(30),
            ),

            child: const Text(
              "Golongan G",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 22),

          const Divider(color: Colors.white54),

          const SizedBox(height: 12),

          const Text(
            "My Skills",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          const Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: [
              Chip(label: Text("Flutter")),
              Chip(label: Text("Dart")),
              Chip(label: Text("UI Design")),
            ],
          ),
        ],
      ),
    );
  }

  // PROYEK, GALERI DAN KONTAK
  Widget buildKonten(bool isTablet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const Text(
          "Proyek Saya",
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 12),

        Card(
          color: Colors.white,
          child: ListTile(
            contentPadding: const EdgeInsets.all(15),

            leading: const Icon(
              Icons.folder,
              size: 40,
              color: Colors.amber,
            ),

            title: const Text(
              "Kartu Profil Digital",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            subtitle: const Text("Contoh proyek Flutter"),

            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ),
        ),

        const SizedBox(height: 25),

        const Text(
          "Galeri",
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 12),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 6,

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isTablet ? 4 : 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),

          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(12),
              ),

              child: const Icon(
                Icons.image_outlined,
                color: Colors.purple,
                size: 40,
              ),
            );
          },
        ),

        const SizedBox(height: 28),

        const Text(
          "Hubungi Saya",
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 12),

        const Card(
          color: Colors.white,
          child: ListTile(
            leading: Icon(
              Icons.email_outlined,
              color: Colors.purple,
            ),

            title: Text("Email"),

            subtitle: Text("Kontak belum ditambahkan"),
          ),
        ),
      ],
    );
  }
}

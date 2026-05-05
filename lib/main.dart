import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WorkshopPage(
        isDarkMode: isDarkMode,
        toggleTheme: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
      ),
    );
  }
}

//////////////////////////////////////////////////////
// HALAMAN UTAMA
//////////////////////////////////////////////////////

class WorkshopPage extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const WorkshopPage({
    required this.isDarkMode,
    required this.toggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,

      appBar: AppBar(
        title: Text("Workshop Info"),
        centerTitle: true,
        backgroundColor:
            isDarkMode ? Color(0xFF00FFFF) : Color(0xFF0D47A1),
        foregroundColor:
            isDarkMode ? Colors.black : Colors.white,
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: toggleTheme,
          )
        ],
      ),

      body: Container(
        decoration: BoxDecoration(
          gradient: isDarkMode
              ? LinearGradient(
                  colors: [
                    Colors.black,
                    Color(0xFF001F3F),
                    Color(0xFF00FFFF),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
        ),

        child: Center(
          child: Card(
            color: isDarkMode
                ? Colors.black.withOpacity(0.8)
                : Colors.white,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.all(20),

            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Flutter Workshop Davin Absalom - 231011400351",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color:
                          isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Tanggal: 5 Mei 2026",
                    style: TextStyle(
                        color: isDarkMode
                            ? Colors.white70
                            : Colors.black87),
                  ),
                  Text(
                    "Lokasi: Zoom Online",
                    style: TextStyle(
                        color: isDarkMode
                            ? Colors.white70
                            : Colors.black87),
                  ),
                  Text(
                    "Kuota: 50 peserta",
                    style: TextStyle(
                        color: isDarkMode
                            ? Colors.white70
                            : Colors.black87),
                  ),

                  SizedBox(height: 20),

                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isDarkMode
                            ? Color(0xFF00FFFF)
                            : Color(0xFF1565C0),
                        foregroundColor:
                            isDarkMode ? Colors.black : Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: 30, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),

                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SuccessPage(isDarkMode: isDarkMode),
                          ),
                        );
                      },

                      child: Text("Daftar"),
                    ),
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

//////////////////////////////////////////////////////
// HALAMAN SUKSES
//////////////////////////////////////////////////////

class SuccessPage extends StatelessWidget {
  final bool isDarkMode;

  const SuccessPage({required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isDarkMode ? Colors.black : Colors.white,

      appBar: AppBar(
        title: Text("Pendaftaran"),
        backgroundColor:
            isDarkMode ? Color(0xFF00FFFF) : Colors.green,
        foregroundColor:
            isDarkMode ? Colors.black : Colors.white,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: isDarkMode ? Colors.cyan : Colors.green,
              size: 80,
            ),

            SizedBox(height: 20),

            Text(
              "Pendaftaran Berhasil!",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color:
                    isDarkMode ? Colors.white : Colors.black,
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Terima kasih sudah mendaftar 😊",
              style: TextStyle(
                color:
                    isDarkMode ? Colors.white70 : Colors.black87,
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isDarkMode
                    ? Color(0xFF00FFFF)
                    : Colors.green,
                foregroundColor:
                    isDarkMode ? Colors.black : Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Kembali"),
            )
          ],
        ),
      ),
    );
  }
}
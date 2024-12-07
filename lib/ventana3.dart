import 'package:flutter/material.dart';

class Ventana3 extends StatelessWidget {
  const Ventana3({super.key});

  @override
  Widget build(BuildContext context) {
    final hiController = TextEditingController();
    final tController = TextEditingController();
    final a = 20.0; // Aceleración media constante en m/s^2

    return Scaffold(
      appBar: AppBar(
        title: const Text("LANZAMIENTO DEL COHETE"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black87, Colors.greenAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "LANZAMIENTO DE COHETE",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Colors.black,
                      offset: Offset(3.0, 3.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: hiController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: "Altura inicial (h₁)",
                  labelStyle: TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.height, color: Colors.white70),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.greenAccent, width: 2),
                  ),
                  filled: true,
                  fillColor: Colors.black54,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: tController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: "Tiempo (t) s",
                  labelStyle: TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.timer, color: Colors.white70),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.greenAccent, width: 2),
                  ),
                  filled: true,
                  fillColor: Colors.black54,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final h1 = double.parse(hiController.text);
                  final t = double.parse(tController.text);
                  final h = h1 + 0.5 * a * t * t;
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Altura del Cohete"),
                      content: Text("La altura alcanzada es: $h m"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  backgroundColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadowColor: Colors.black,
                  elevation: 5,
                ),
                child: const Text(
                  "Calcular",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

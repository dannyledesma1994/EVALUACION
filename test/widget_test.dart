import 'package:flutter/material.dart';

class Ventana2 extends StatelessWidget {
  const Ventana2({super.key});

  @override
  Widget build(BuildContext context) {
    final wController = TextEditingController();
    final tController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de distancia"),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black87, Colors.redAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Calcula la distancia recorrida en el carrusel",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: wController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: "Velocidad angular (w) rad/s",
                labelStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.speed, color: Colors.white70),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orangeAccent),
                ),
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
                  borderSide: BorderSide(color: Colors.orangeAccent),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final w = double.parse(wController.text);
                final t = double.parse(tController.text);
                final distancia = w * t;
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Distancia Recorrida"),
                    content: Text("La distancia recorrida es: $distancia rad"),
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
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                "Calcular",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Ventana2 extends StatelessWidget {
  const Ventana2({super.key});

  @override
  Widget build(BuildContext context) {
    final wController = TextEditingController();
    final tController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("CALCULA LA DISTANCIA"),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "CALCULA LA DISTANCIA RECORRIDA EN EL CARRUSEL",
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
                controller: wController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: "Velocidad angular (w) rad/s",
                  labelStyle: TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.speed, color: Colors.white70),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orangeAccent, width: 2),
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
                    borderSide: BorderSide(color: Colors.orangeAccent, width: 2),
                  ),
                  filled: true,
                  fillColor: Colors.black54,
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
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  backgroundColor: Colors.orangeAccent,
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

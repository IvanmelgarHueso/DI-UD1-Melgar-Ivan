import 'package:flutter/material.dart';
import 'widgets/info_tar.dart'; 

void main() {
  runApp(const MiAppVideojuego());
}

class MiAppVideojuego extends StatelessWidget {
  const MiAppVideojuego({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tarjeta Videojuego',
      theme: ThemeData.dark(),
      home: const TarjetaPantalla(),
    );
  }
}
 
class TarjetaPantalla extends StatelessWidget {
  const TarjetaPantalla({super.key});

  // Callback para el botón de PC
  void _notificarPlataforma() {
    print('Se ha seleccionado la plataforma PC.');
  }

  // Función que recibe parámetros 
  void _compartirConAmigos(String tituloJuego, String redSocial) {
    print('Compartiendo "$tituloJuego" con amigos vía $redSocial.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      // Botón flotante 
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFFE52E2E),
        icon: const Icon(Icons.share, color: Colors.white),
        label: const Text(
          'Compartir',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          _compartirConAmigos('Albion ONLINE', 'WhatsApp');
        },
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 360,
              decoration: BoxDecoration(
                color: const Color(0xFF7A2424), // Fondo rojo 
                borderRadius: BorderRadius.circular(28),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Imagen Principal
                  Stack(
                    children: [
                      // Gestos sobre la portada
                      GestureDetector(
                        onTap: () {
                          print('Tap sobre la portada del juego.');
                        },
                        onDoubleTap: () {
                          // Acción ejecutada sin modificar estado de la interfaz
                          print('Doble tap registrado en la portada de Albion ONLINE.');
                        },
                        child: Image.asset(
                          'assets/Portada_Albion.png', 
                          height: 320,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 320,
                              color: Colors.grey[900],
                              child: const Center(
                                child: Icon(Icons.broken_image, size: 50, color: Colors.white54),
                              ),
                            );
                          },
                        ),
                      ),
                      // Estrellas / Calificación
                      Positioned(
                        top: 14,
                        right: 14,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.85),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '4.8',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                              SizedBox(width: 3),
                              Icon(Icons.star, color: Colors.amber, size: 14),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Contenido de la tarjeta
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '9SEE STUDIOS',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.1,
                          ),
                        ),
                        const SizedBox(height: 4),

                        const Text(
                          'Albion ONLINE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),

                        const Text(
                          'Acción · RPG · Ciencia ficción',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 14),

                        const Text(
                          'Forja tu propio camino...',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Botones de Plataforma (PC, PS5)
                        Row(
                          children: [
                            // Pasando la referencia a la función
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF141F2B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: _notificarPlataforma,
                              child: const Text('PC', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(width: 10),
                            // Función anónima en línea
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF141F2B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () {
                                print('Se ha seleccionado la plataforma PS5.');
                              },
                              child: const Text('PS5', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Rejilla 2x2 usando el widget extraído info_tar
                        GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 1.4,
                          children: const [
                            info_tar(
                              icon: Icons.calendar_today,
                              title: 'LANZAMIENTO',
                              subtitle: '22 oct 2017',
                            ),
                            info_tar(
                              icon: Icons.access_time,
                              title: 'DURACIÓN',
                              subtitle: 'Infinito ∞',
                            ),
                            info_tar(
                              icon: Icons.people_outline,
                              title: 'MODOS',
                              subtitle: '1 jugador + coop.',
                            ),
                            info_tar(
                              icon: Icons.translate,
                              title: 'IDIOMAS',
                              subtitle: 'Audio en español',
                            ),
                          ],
                        ),
                      ],
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
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = "snackbar_screen";

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    // lo limpia para que no aparezcan varios cuando oprime varias veeces el boton
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Hola mundo'),
        action: SnackBarAction(label: 'Ok!', onPressed: () {}),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estas Seguro?'),
        content: const Text(
            'Deserunt consequat ullamco id dolore id id enim mollit laborum fugiat. Tempor veniam nulla fugiat incididunt nulla laborum ea sit qui ullamco commodo eiusmod nulla cupidatat. Non proident voluptate ut id quis Lorem anim voluptate elit labore irure. Qui excepteur minim velit eu et dolor eiusmod exercitation ipsum culpa nisi laboris. Amet ad culpa commodo do magna eu pariatur aute magna nisi.'),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => context.pop(),
            child: const Text('Aceptar'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text(
                        'Dolore in cupidatat irure cillum qui ut est cillum ad ad officia eu. Aute aute velit ullamco consequat eiusmod sint ea incididunt nostrud laborum. Eu dolor ullamco est nisi id. Proident voluptate non ullamco culpa adipisicing excepteur magna fugiat nisi aliqua Lorem ad. Cillum magna velit sit proident occaecat irure deserunt laboris.'),
                  ],
                );
              },
              child: const Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar Dialogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}

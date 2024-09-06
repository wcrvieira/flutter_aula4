import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Segunda extends StatefulWidget {
  const Segunda({super.key});

  @override
  State<Segunda> createState() => _SegundaState();
}

class _SegundaState extends State<Segunda> {
  String ajudaData = 'Exemplo: 01/01/1970';
  TextEditingController controlaNome = TextEditingController();
  TextEditingController controlaSobrenome = TextEditingController();
  TextEditingController controlaDataNascimento = TextEditingController();
  TextEditingController controlaSenha = TextEditingController();
  TextEditingController controlaContraSenha = TextEditingController();
  late FocusNode focoNome = FocusNode();

  @override
  void dispose() {
    controlaDataNascimento.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: controlaNome,
                focusNode: focoNome,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nome:',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: controlaSobrenome,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Sobrenome',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                onChanged: (String value) async {
                  FilteringTextInputFormatter.allow(
                    RegExp("(^[^-\\s][a-zA-Z0-9_\\s-]+\$)"));
                    // Em evolução
                },
                controller: controlaDataNascimento,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Data de nascimento',
                  helperText: ajudaData,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(                
                controller: controlaSenha,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Senha',
                ),
              ),
              const SizedBox(
                height: 50,
              ),             
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controlaNome.clear();
                      controlaSobrenome.clear();
                      controlaDataNascimento.clear();
                      controlaSenha.clear();
                      focoNome.requestFocus();
                    },
                    child: const Text('Limpar'),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Enviar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

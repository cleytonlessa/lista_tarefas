import 'package:flutter/material.dart';
import 'package:mobile/data/task_dao.dart';
import 'package:mobile/data/task_inherited.dart';
import 'package:mobile/screens/form_screen.dart';

import '../components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          IconButton(
              onPressed: (){setState(() {

              });},
              icon: const Icon(Icons.refresh)
          )
        ],
        title: const Text('Tarefas'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<Task>>(
          future: TaskDao().findAll(),
          builder: (context,snapshot){
            List<Task>? items = snapshot.data;
            switch (snapshot.connectionState){
              case ConnectionState.none:
                return const Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text('Carregando')
                    ],
                  ),
                );
                break;
              case ConnectionState.waiting:
                return const Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text('Carregando')
                    ],
                  ),
                );
                break;
              case ConnectionState.active:
                return const Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text('Carregando')
                    ],
                  ),
                );
                break;
              case ConnectionState.done:
                if(snapshot.hasData && items != null){
                  if (items.isNotEmpty){
                    return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, int index){
                          final Task tarefa = items[index];
                          return tarefa;
                        }
                    );
                  }
                  return const Center(
                    child: Column(
                      children: [
                        Icon(Icons.error_outline, size: 128),
                        Text('Não há nenhuma Tarefa',
                          style: TextStyle(fontSize: 32),
                        )
                      ],
                    ),
                  );
                }
                return Text('Erro ao carregar Tarefas');
                break;
            }
            return Text('Erro Desconhecido');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (contextNew) => FormScreen(
                  taskContext: context,
                )
            )
        ).then((value) => setState((){
          print('Recarregando a tela inicial');
        }));
      },
        child: const Icon(Icons.add),
      ),
    );
  }
}
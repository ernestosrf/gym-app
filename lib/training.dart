// ignore_for_file: unused_import, duplicate_import, unnecessary_import, use_build_context_synchronously

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gym_app/assets/header/header.dart';
import 'assets/bottomNavigator/bottomNavigator.dart';
import 'package:gym_app/firestore_service.dart';
import 'firebase_options.dart';

import 'assets/header/header.dart';
class TrainingPage extends StatefulWidget {
  final String? exerciseId;
  final String? exerciseName;
  final String? weight;
  final int? reps;
  final String? muscleGroup;

  const TrainingPage({super.key, 
    this.exerciseId,
    this.exerciseName,
    this.weight,
    this.reps,
    this.muscleGroup,
    });

  @override
  TrainingPageState createState() => TrainingPageState();
}

class TrainingPageState extends State<TrainingPage> {
  String dropdownValue = 'Grupo muscular';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirestoreService _firestoreService = FirestoreService();
  late TextEditingController _exerciseNameController;
  late TextEditingController _weightController;
  late TextEditingController _repsController;

  @override
  void initState() {
    super.initState();
    _exerciseNameController = TextEditingController(text: widget.exerciseName ?? '');
    _weightController = TextEditingController(text: widget.weight ?? '');
    _repsController = TextEditingController(text: widget.reps?.toString() ?? '');
    if (widget.muscleGroup != null) {
      dropdownValue = widget.muscleGroup!;
    }
  }

Future<void> _submitForm() async {
if (_formKey.currentState!.validate()) {
  final exerciseData = {
    'name': _exerciseNameController.text,
    'weight': _weightController.text,
    'reps': int.parse(_repsController.text),
    'muscleGroup': dropdownValue,
  };

  if (widget.exerciseName != null) {
    // edit existing exercise
    final userId = await _firestoreService.getUserIdFromFirestore();
    if (userId != null) {
      _firestoreService.updateExercise(userId, widget.exerciseId!, exerciseData);
      Navigator.pop(context);
    } else {
      if (kDebugMode) {
        print('User ID not available');
      }
    }
  } else {
    // create a new exercise
    final userId = await _firestoreService.getUserIdFromFirestore();
    if (userId != null) {
      _firestoreService.addExercise(userId, exerciseData);
      Navigator.pop(context);
    } else {
      if (kDebugMode) {
        print('User ID not available');
      }
    }
  }
}
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Header(),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: 35,
            bottom: 35,
            left: 35,
            right: 35,     
          ),
          child: Form(
            key: _formKey,
            child: Column(children: [
          Row(
            children: [
              const Text(
                "Meus treinos",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                ">",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                widget.exerciseName == null
                ? 'Novo exercício' 
                : _exerciseNameController.text,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
              ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 3.5),
                ),
              ],
            ),
            child: TextField(
              controller: _exerciseNameController,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                labelText: 'Exercício',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 3.5),
                ),
              ],
            ),
            child: TextField(
              controller: _weightController,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                labelText: 'Carga (kg)',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 3.5),
                ),
              ],
            ),
            child: TextField(
              controller: _repsController,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                labelText: 'Número de Repetições',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 3.5),
                ),
              ],
            ),
            child: DropdownButtonFormField<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>[
                'Grupo muscular', 
                'Peito', 
                'Costas', 
                'Bíceps', 
                'Tríceps', 
                'Pernas', 
                'Ombros', 
                'Abdômen'
                ]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            //submit button
            width: 80,
            height: 47,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color.fromRGBO(187, 198, 207, 1),
            ),

            child: TextButton(
              onPressed: () {
                _submitForm();
              },
              child: const Text(
                'Salvar',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ),
          widget.exerciseName == null
            ? const SizedBox(height: 0)
            : Column(
              children: [
                const SizedBox(height: 20),
                const Divider(
                  color: Colors.grey,
                  height: 20,
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                ),
                // Input de séries
                const SizedBox(height: 20),
                Column(
                  children: [
                    const Text(
                      'Insira novos dados',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: TextField(
                              controller: TextEditingController(text: 'Séries'),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 2.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const SizedBox(height: 20),
                        Container(
                          width: 70,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: const Color.fromRGBO(187, 198, 207, 1),
                          ),
                          child: TextButton(
                            onPressed: () {
                              // ignore: avoid_print
                              print('Adc');
                            },
                            child: const Text(
                              'Adc',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Seus últimos registros",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                // // Tabela de registros
                const Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Dia",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Text(
                        "Qtd. de Séries",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Text(
                        "Carga",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      )
                    ],
                  ),
                  //para cada novo dado, um novo Row (Se houver metódo mais eficiente, favor alterar)
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("29/03"), Text("20"), Text("25 kg")],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("29/03"), Text("20"), Text("25 kg")],
                  )
                ]),
              ],
            )
        ])),
      ),
      bottomNavigationBar: const BottomNavigator(),
    );
  }
}

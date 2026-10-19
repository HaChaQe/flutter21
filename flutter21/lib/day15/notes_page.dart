
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {

  final TextEditingController _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return const Scaffold(
        body: Center(
          child: Text("Önce giriş yapmalısın"),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: "Not başlığı",
                prefixIcon:Icon(Icons.edit_note),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                    width: 10
                  )
                )
              )
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if (_titleController.text.trim().isEmpty) return;
              try {
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(user.uid)
                    .collection('notes')
                    .add({
                  'title': _titleController.text.trim(), 
                  'isDone': false,
                  'createdAt': FieldValue.serverTimestamp(),
                });

                debugPrint("Not başarıyla eklendi!");
              } catch (e) {
                debugPrint("Firestore hatası: $e");
              }
            },
            child: const Text("Not Ekle"),
          ),

          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(user.uid)
                  .collection('notes')
                  .orderBy('createdAt', descending: false)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Veriler yüklenirken hata oluştu"),
                  );
                }

                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final notes = snapshot.data!.docs;

                return Center(
                  child: ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("Not ${index + 1}: ${notes[index].data()['title']}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                              value: notes[index].data()['isDone'],
                              onChanged: (value) async {
                                await FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(user.uid)
                                    .collection('notes')
                                    .doc(notes[index].id)
                                    .update({'isDone': value});
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () async {
                                await FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(user.uid)
                                    .collection('notes')
                                    .doc(notes[index].id)
                                    .delete();
                              },
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

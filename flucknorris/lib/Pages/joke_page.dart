import 'package:flucknorris/models/joke_model.dart';
import 'package:flutter/material.dart';

class JokePage extends StatelessWidget {
  @override
  JokePage(this.joke, this.categoria);

  final JokeModel joke;
  final String categoria;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Categoria escolhida: $categoria'),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 22),
              Hero(
                tag: 'chuck',
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/chuck.jpg'),
                  radius: 80,
                ),
              ),
              SizedBox(height: 22),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(joke.value,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          ),
        ));
  }
}

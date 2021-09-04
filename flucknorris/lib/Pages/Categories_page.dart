import 'package:flucknorris/pages/joke_page.dart';
import 'package:flucknorris/repositories/joke_repository.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final jokeRepository = JokeRepository();
  Future<List<String>> futureCategories;

  List<String> categories = [];

  @override
  void initState() {
    futureCategories = jokeRepository.getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escolha a categoria desejada'),
        leading: Hero(
          tag: 'chuck',
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/chuck.jpg'),
          ),
        ),
      ),
      // ignore: missing_return
      body: FutureBuilder<List<String>>(
        future: futureCategories,
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Deu erro na requisição http!"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            final categories = snapshot.data;
            return ListView.separated(
                itemBuilder: (_, i) => ListTile(
                      onTap: () async {
                        final joke = await jokeRepository
                            .getJokeByCategory(categories[i]);
                        print(joke.value);

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => JokePage(joke, categories[i])));
                      },
                      leading: Text('${i + 1}',
                          style: TextStyle(
                            fontSize: 22,
                          )),
                      title: Text(categories[i],
                          style: TextStyle(
                            fontSize: 22,
                          )),
                    ),
                separatorBuilder: (_, i) => Divider(),
                itemCount: categories.length);
          } else {
            return Center(
              child: Text("Erro desconhecido!"),
            );
          }
        },
      ),
    );
  }
}

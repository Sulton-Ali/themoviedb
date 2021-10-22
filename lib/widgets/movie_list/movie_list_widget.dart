// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';

class Movie {
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}

class MovieListWidget extends StatefulWidget {
  MovieListWidget({Key? key}) : super(key: key);

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
      title: "Гнев человеческий",
      time: "22 апреля 2021",
      description:
          "Хмурый мужчина прикидывается инкассатором, чтобы выйти на грабителей.",
      imageName: AppImages.poster,
    ),
    Movie(
      title: "Лига справедливости Зака Снайдера",
      time: "18 марта 2021",
      description: "Бэтмен собирает команду супергероев, чтобы спасти Землю.",
      imageName: AppImages.poster,
    ),
    Movie(
      title: "Дюна (2021)",
      time: "16 сентября 2021",
      description:
          "Наследник знаменитого дома Атрейдесов Пол отправляется вместе с семьей на одну из самых опасных планет во Вселенной — Арракис.",
      imageName: AppImages.poster,
    ),
    Movie(
      title: "Райя и последний дракон",
      time: "4 марта 2021",
      description: "Дочь вождя ищет магическое существо в надежде спасти мир.",
      imageName: AppImages.poster,
    ),
    Movie(
      title: "Никто",
      time: "18 марта 2021",
      description:
          "Задетый за живое обыватель превращается в крутого защитника семьи. ",
      imageName: AppImages.poster,
    ),
    Movie(
      title: "Гнев человеческий 2",
      time: "22 апреля 2021",
      description:
          "Хмурый мужчина прикидывается инкассатором, чтобы выйти на грабителей.",
      imageName: AppImages.poster,
    ),
    Movie(
      title: "Лига справедливости Зака Снайдера 2",
      time: "18 марта 2021",
      description: "Бэтмен собирает команду супергероев, чтобы спасти Землю.",
      imageName: AppImages.poster,
    ),
    Movie(
      title: "Дюна (2021) 2",
      time: "16 сентября 2021",
      description:
          "Наследник знаменитого дома Атрейдесов Пол отправляется вместе с семьей на одну из самых опасных планет во Вселенной — Арракис.",
      imageName: AppImages.poster,
    ),
    Movie(
      title: "Райя и последний дракон 2",
      time: "4 марта 2021",
      description: "Дочь вождя ищет магическое существо в надежде спасти мир.",
      imageName: AppImages.poster,
    ),
    Movie(
      title: "Никто 2",
      time: "18 марта 2021",
      description:
          "Задетый за живое обыватель превращается в крутого защитника семьи. ",
      imageName: AppImages.poster,
    ),
    Movie(
      title: "Гнев человеческий 3",
      time: "22 апреля 2021",
      description:
          "Хмурый мужчина прикидывается инкассатором, чтобы выйти на грабителей.",
      imageName: AppImages.poster,
    ),
    Movie(
      title: "Лига справедливости Зака Снайдера 3",
      time: "18 марта 2021",
      description: "Бэтмен собирает команду супергероев, чтобы спасти Землю.",
      imageName: AppImages.poster,
    ),
    Movie(
      title: "Дюна (2021) 3",
      time: "16 сентября 2021",
      description:
          "Наследник знаменитого дома Атрейдесов Пол отправляется вместе с семьей на одну из самых опасных планет во Вселенной — Арракис.",
      imageName: AppImages.poster,
    ),
    Movie(
      title: "Райя и последний дракон 3",
      time: "4 марта 2021",
      description: "Дочь вождя ищет магическое существо в надежде спасти мир.",
      imageName: AppImages.poster,
    ),
    Movie(
      title: "Никто 3",
      time: "18 марта 2021",
      description:
          "Задетый за живое обыватель превращается в крутого защитника семьи. ",
      imageName: AppImages.poster,
    ),
  ];

  var _filteredMovies = <Movie>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: EdgeInsets.only(top: 70),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: _filteredMovies.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index) {
            final movie = _filteredMovies[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black.withOpacity(0.2)),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, 2),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(movie.imageName),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Text(
                                movie.title,
                                style: TextStyle(fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 5),
                              Text(
                                movie.time,
                                style: TextStyle(color: Colors.grey),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 20),
                              Text(
                                movie.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10)
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: "Поиск",
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}

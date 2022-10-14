import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/vivek_official/stream_sample/second_screen.dart';
import 'package:flutter_sample/vivek_official/stream_sample/viewmodel_stream.dart';
import 'package:flutter_sample/vivek_official/news_project/models/news_article.dart';
import 'package:flutter_sample/vivek_official/news_project/widgets/circle_image.dart';

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  StreamViewModel _streamViewModel = StreamViewModel();
  @override
  void initState() {
    _streamViewModel.getNews();
    // StreamViewModel().streamController.stream.listen((event) {

    // });
    super.initState();
  }

  @override
  void dispose() {
    _streamViewModel.streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Streams')),
      body: SafeArea(
        child: StreamBuilder<List<NewsArticle>>(
            stream: _streamViewModel.streamController.stream,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SecondScreen();
                            }));
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                          ),
                          child: const Text('Go to second screen'),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Expanded(
                          child: Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    );
                  }
                default:
                  {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('Something went wrong'),
                      );
                    } else {
                      return ListView(
                        children: snapshot.data!.map((e) {
                          return ListTile(
                            leading: CircleAvatar(
                              child: CachedNetworkImage(
                                width: 25,
                                height: 25,
                                fit: BoxFit.cover,
                                imageUrl: e.urlToImage ?? '',
                              ),
                            ),
                            title: Text(
                              e.title.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }).toList(),
                      );
                    }
                  }
              }
            }),
      ),
    );
  }
}

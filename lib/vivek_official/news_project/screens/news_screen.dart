import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/vivek_official/news_project/internet_connectivity/cubit/internet_cubit.dart';
// import 'package:flutter_sample/vivek_official/news_project/internet_connectivity/internet_state.dart';
import 'package:flutter_sample/vivek_official/news_project/models/news_article.dart';
import 'package:flutter_sample/vivek_official/news_project/screens/news_article_detail_screen.dart';
import 'package:flutter_sample/vivek_official/news_project/services/api_response.dart';
import 'package:flutter_sample/vivek_official/screens/otp_verification_screen.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';
import '../viewmodels/news_article_list_view_model.dart';
import '../widgets/news_grid.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  void showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        // action: SnackBarAction(
        //     label: 'Retry',
        //     onPressed: () {
        //       fetchNews();
        //     }),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void fetchNews() {
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .topHeadlines();
  }

  Widget _buildList(ApiResponse apiResponse) {
    switch (apiResponse.status) {
      case Status.LOADING:
      case Status.INITIAL:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case Status.COMPLETED:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: NewsGrid(
            articles: apiResponse.data as List<NewsArticle>,
          ),
        );
      case Status.ERROR:
        // showSnackBar();
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.only(top: 100),
            child: Center(
              child: Text(apiResponse.message!),
            ),
          ),
        );

      default:
        return const Center(
          child: Text("No results found"),
        );
    }
  }

  void _selectCountry(String country) {
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .topHeadlinesByCountry(Constants.Countries[country]!);
  }

  @override
  Widget build(BuildContext context) {
    var vs = Provider.of<NewsArticleListViewModel>(context).response;
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (value) {
              _selectCountry(value);
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) {
              return Constants.Countries.keys
                  .map((v) => PopupMenuItem(
                        value: v,
                        child: Text(v),
                      ))
                  .toList();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: BlocConsumer<InternetCubit, InternetState>(
            listener: (context, state) {
          if (state == InternetState.connected) {
            fetchNews();
            showSnackBar('Connected');
          } else if (state == InternetState.lost) {
            showSnackBar('Connection Lost');
          }
        }, builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              fetchNews();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    'News',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
                const Divider(
                  height: 40,
                  color: Color(0xffFF8A30),
                  thickness: 4,
                  indent: 30,
                  endIndent: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30, top: 15, bottom: 15),
                  child: Text(
                    'Headlines',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: _buildList(vs),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

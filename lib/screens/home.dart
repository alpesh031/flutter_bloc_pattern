import 'package:counter_app_flutter_bloc/screens/post_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/post_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => BlocProvider.value(value: context.read<PostBloc>(), child: PostList())));
        },
        child: Text('Go To Listing'),
      ),
    );
  }
}

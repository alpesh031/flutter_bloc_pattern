import 'package:counter_app_flutter_bloc/model/post_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final Dio dio;

  PostBloc({required this.dio}) : super(PostInitial()) {
    on<FetchPosts>(_onFetchPosts);
  }

  void _onFetchPosts(FetchPosts event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      final response = await dio.get('https://jsonplaceholder.typicode.com/posts');
      final List<Post> posts = (response.data as List)
          .map((json) => Post.fromJson(json))
          .toList();
      emit(PostLoaded(posts));
    } catch (e) {
      emit(PostError('Failed to load posts'));
    }
  }
}
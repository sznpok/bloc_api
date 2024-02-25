import 'dart:developer';

import 'package:bloc_api/blocs/postbloc/post_event.dart';
import 'package:bloc_api/repo/post_api.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/post_model.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super((PostLoadingState())) {
    on<LoadPostEvent>((event, emit) async {
      emit(PostLoadingState());
      try {
        final post = await PostApi().fetchPostApi();
        emit(PostSuccessSate(post));
      } catch (e) {
        emit(PostErrorState(e.toString()));
      }
    });
  }
}

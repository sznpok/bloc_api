import 'dart:ffi';
import 'dart:js_interop';

import 'package:bloc_api/blocs/postbloc/post_bloc.dart';
import 'package:bloc_api/blocs/postbloc/post_event.dart';
import 'package:bloc_api/model/post_model.dart';
import 'package:bloc_api/page/login_page.dart';
import 'package:bloc_api/repo/post_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List view'),
      ),
      body: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
        context.read<LoadPostEvent>
        if (state is PostLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PostSuccessSate) {
          List<PostModel> model = state.models;
          return ListView.builder(
              itemCount: model.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(model[index].title!),
                  subtitle: Text(model[index].userId.toString()),
                );
              });
        } else if (state is PostErrorState) {
          return Center(
            child: Text(state.message),
          );
        }
        return Container();
      }),
    );
  }
}

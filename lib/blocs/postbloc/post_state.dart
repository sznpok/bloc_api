part of 'post_bloc.dart';

@immutable
abstract class PostState extends Equatable {}

//data loading State
class PostLoadingState extends PostState {
  @override
  List<Object?> get props => [];
}

//data loaded state that means success state
class PostSuccessSate extends PostState {
  final List<PostModel> models;

  PostSuccessSate(this.models);

  @override
  List<Object?> get props => [models];
}

class PostErrorState extends PostState {
  final String message;

  PostErrorState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

//data error state

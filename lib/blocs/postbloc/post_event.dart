import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class PostEvent extends Equatable {
  const PostEvent();
}

class LoadPostEvent extends PostEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

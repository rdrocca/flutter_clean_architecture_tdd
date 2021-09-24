import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable {
  final List properties = <dynamic>[];

  @override
  List<Object?> get props => [properties];
}

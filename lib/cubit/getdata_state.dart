part of 'getdata_cubit.dart';

abstract class GetDataState extends Equatable {
  const GetDataState();

  @override
  List<Object> get props => [];
}

class GetDataInitial extends GetDataState {}

class GetDataSuccess extends GetDataState {
  final List<DataProduct> datamodel;

  const GetDataSuccess({required this.datamodel});

  @override
  List<Object> get props => [datamodel];
}

class GetDataFailure extends GetDataState {
  final String message;

  GetDataFailure({required this.message});

  @override
  List<Object> get props => [message];
}

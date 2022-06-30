import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:superindo/model/dataproduct_model.dart';

part 'getdata_state.dart';

class GetDataCubit extends Cubit<GetDataState> {
  GetDataCubit() : super(GetDataInitial());

  Future<void> getData() async {
    try {
      Dio dio = Dio();
      final response = await dio
          .get('https://61ea514a7bc0550017bc66b4.mockapi.io/api/v1/products');
      var dataResponse = response.data['products'] as List;
      List<DataProduct> data =
          dataResponse.map((i) => DataProduct.fromJson(i)).toList();

      emit(GetDataSuccess(datamodel: data));
    } catch (e) {
      emit(GetDataFailure(message: 'Failed to get data'));
    }
  }
}

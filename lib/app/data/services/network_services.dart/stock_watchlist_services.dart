import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../../models/network_models/company_model.dart';

class StockWatchListApi {
  Dio dio = Dio();

  Future<List<CompanyModel>?> fetchCompanyDetails(String query) async {
    log('fetch Company');
    try {
      final response = await dio.get(
          'https://dev.portal.tradebrains.in/api/search?keyword=${query.trim()}&apikey=HM76H03Y5JRCWJIB');

      log(response.toString());
      log(response.statusCode.toString());
      log(response.statusMessage.toString());
      if (response.statusCode == 200) {
        List<dynamic> res = response.data;

        final List<CompanyModel> companyModel = res
            .map((e) => CompanyModel.fromJson(e))
            .cast<CompanyModel>()
            .toList();

        // final List<CompanyModel> companyModel =
        //     CompanyModel.fromJson(response.data);
        return companyModel;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}

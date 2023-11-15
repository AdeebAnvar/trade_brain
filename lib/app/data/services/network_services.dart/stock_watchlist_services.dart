import 'dart:developer';

import 'package:dio/dio.dart';

import '../../models/network_models/company_model.dart';

class StockWatchListApi {
  Dio dio = Dio();

  Future<GlobalQuote?> fetchCompanyDetails(String query) async {
    try {
      final Response<dynamic> response = await dio.get(
          'https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=${query.trim().toUpperCase()}&apikey=HM76H03Y5JRCWJIB');

      log(response.toString());
      if (response.statusCode == 200) {
        final CompanyModel companyModel =
            CompanyModel.fromJson(response.data as Map<String, dynamic>);
        return companyModel.globalQuote!;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}

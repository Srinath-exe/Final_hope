import 'dart:io';

import 'package:hope/Model/BrandList_model.dart';
import 'package:hope/Model/CuponList.dart';
import 'package:hope/Model/Login_model.dart';
import 'package:hope/Model/OffersList.dart';
import 'package:hope/Model/ProductlistAll.dart';
import 'package:hope/Model/StoreListAll.dart';
import 'package:hope/Model/productDetails.dart';
import 'package:hope/Model/profile_model.dart';
import 'package:hope/Model/register_model.dart';
import 'package:hope/Screens/profile.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  String baseUrl = 'https://hope.pustkam.com/public';
  final String token;
  ApiService({this.token});
  String gettoken() {
    return token;
  }

  // Map<String,String> headerlist={
  //     HttpHeaders.authorizationHeader: 'Basic ${gettoken()}',
  //   };
  Future<ResponseLogin> login(PostLogin loginModel) async {
    var url = Uri.parse(baseUrl + "/token");
    var response = await http.post(url, body: postLoginToJson(loginModel));
    print('Login response Status: ${response.statusCode}');
    print('Login response body: ${response.body}');
    if (response.statusCode == 201) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('token', 'Bearer ${responseLogin.token}');
      preferences.setString('uuid', '${responseLogin.uuid}');
      return responseLogin;
    } else
      return null;
  }

  Future<ResponseLogin> signUp(PostRegister registermodel) async {
    var url = Uri.parse(baseUrl + "/admin_accountsCreate");
    var response = await http.post(
      url,
      body: postRegisterToJson(registermodel),
    );
    print('Singup response status: ${response.statusCode}');
    print('singup response body: ${response.body}');
    if (response.statusCode == 201) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    } else
      return null;
  }

  Future<List<GetBrandList>> brandlist() async {
    var url = Uri.parse(baseUrl + "/system_brandsSelectAll/0/100");
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: 'Basic ${gettoken()}',
    });
    print('brandlist response status: ${response.statusCode}');
    print('brandlist response body: ${response.body}');
    if (response.statusCode == 201) {
      List<GetBrandList> getBrandList = getBrandListFromJson(response.body);
      return getBrandList;
    } else
      return [];
  }

  Future<ResponseLogin> branddetails() async {
    var url = Uri.parse(baseUrl + "/system_brandsSelectOne/{brd_id}");
    var response = await http.get(url);
    print('brandlist response status: ${response.statusCode}');
    print('brandlist response body: ${response.body}');
    if (response.statusCode == 201) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    } else
      return null;
  }

  Future<List<GetProductListAll>> productlistall() async {
    var url = Uri.parse(baseUrl + "/system_productsSelectAll/0/100");
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: 'Basic ${gettoken()}',
    });
    print('product List response status: ${response.statusCode}');
    print('ProductList response body: ${response.body}');
    if (response.statusCode == 201) {
      List<GetProductListAll> getproductlistall =
          getProductListAllFromJson(response.body);
      return getproductlistall;
    } else
      return null;
  }

  Future<GetProductDetails> productdetails({String pid}) async {
    var url = Uri.parse(baseUrl + "/system_productsSelectOne/$pid");
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: 'Basic ${gettoken()}',
    });
    print('product detail response status: ${response.statusCode}');
    print('product Detail response body: ${response.body}');
    if (response.statusCode == 201) {
      GetProductDetails productDetail =
          getProductDetailsFromJson(response.body);
      return productDetail;
    } else
      return null;
  }

  Future<List<GetStoreListAll>> storelistall() async {
    var url = Uri.parse(baseUrl + "/system_storeSelectUnlimited");
    var response = await http.get(url, headers: {
      "Keep-Alive": "timeout=20",
      "Accept-Language": "en-US,en;q=0.9",
      "Transfer-Encoding": "chunked",
      HttpHeaders.authorizationHeader: 'Basic ${gettoken()}',
    });
    print('storelistall response status: ${response.statusCode}');
    debugPrint('storelistall response body: ${response.body}');
    if (response.statusCode == 201) {
      print('dsfs ${getStoreListAllFromJson(response.body)}');
      List<GetStoreListAll> storeList = getStoreListAllFromJson(response.body);
      return storeList;
    } else
      return null;
  }

  Future<ResponseLogin> storedetail() async {
    var url = Uri.parse(baseUrl + "/system_storeSelectOne/{str_id}");
    var response = await http.get(url);
    print('brandlist response status: ${response.statusCode}');
    print('brandlist response body: ${response.body}');
    if (response.statusCode == 201) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    } else
      return null;
  }

  Future<ResponseLogin> notificationcount() async {
    var url = Uri.parse(baseUrl + "/users_notificationCountOpen/{uuid}");
    var response = await http.get(url);
    print('brandlist response status: ${response.statusCode}');
    print('brandlist response body: ${response.body}');
    if (response.statusCode == 201) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    } else
      return null;
  }

  Future<ResponseLogin> notificationuserwise() async {
    var url =
        Uri.parse(baseUrl + "/users_notificationSelectAll/{uuid}/{skp}/{lmt}");
    var response = await http.get(url);
    print('brandlist response status: ${response.statusCode}');
    print('brandlist response body: ${response.body}');
    if (response.statusCode == 201) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    } else
      return null;
  }

  Future<ResponseLogin> notificationdetails() async {
    var url =
        Uri.parse(baseUrl + "/users_notificationSelectOne/{uuid}/{msg_id}");
    var response = await http.get(url);
    print('brandlist response status: ${response.statusCode}');
    print('brandlist response body: ${response.body}');
    if (response.statusCode == 201) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    } else
      return null;
  }

  Future<ResponseLogin> notificationdelete() async {
    var url = Uri.parse(baseUrl + "/users_notificationDelete/{uuid}/{msg_id}");
    var response = await http.get(
      url,
    );
    print('brandlist response status: ${response.statusCode}');
    print('brandlist response body: ${response.body}');
    if (response.statusCode == 201) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    } else
      return null;
  }

  Future<List<GetOffersList>> offerslist() async {
    var url = Uri.parse(baseUrl + "/system_offersSelectUnlimited");
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: 'Basic ${gettoken()}',
    });
    print('OffersList response status: ${response.statusCode}');
    print('OffersList response body: ${response.body}');
    if (response.statusCode == 201) {
      List<GetOffersList> getOffersList = getOffersListFromJson(response.body);
      return getOffersList;
    } else
      return null;
  }

  Future<ResponseLogin> offersdetails() async {
    var url = Uri.parse(baseUrl + "/system_offersSelectOne/{ofr_id}");
    var response = await http.get(url);
    print('brandlist response status: ${response.statusCode}');
    print('brandlist response body: ${response.body}');
    if (response.statusCode == 201) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    } else
      return null;
  }

  Future<List<GetCouponList>> couponlist() async {
    var url = Uri.parse(baseUrl + "/system_couponsSelectUnlimited");
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: 'Basic ${gettoken()}',
    });
    print('CouponList response status: ${response.statusCode}');
    print('CouponList response body: ${response.body}');
    if (response.statusCode == 201) {
      List<GetCouponList> getCouponList = getCouponListFromJson(response.body);
      return getCouponList;
    } else
      return null;
  }

  Future<ResponseLogin> coupondetails() async {
    var url = Uri.parse(baseUrl + "/system_couponsSelectOne/{cpn_id}");
    var response = await http.get(url);
    print('brandlist response status: ${response.statusCode}');
    print('brandlist response body: ${response.body}');
    if (response.statusCode == 201) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    } else
      return null;
  }

  Future<ResponseLogin> customerpurchaseslist() async {
    var url =
        Uri.parse(baseUrl + "/users_purchasesSelectAll/{uuid}/{skp}/{lmt}");
    var response = await http.get(url);
    print('brandlist response status: ${response.statusCode}');
    print('brandlist response body: ${response.body}');
    if (response.statusCode == 201) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    } else
      return null;
  }

  Future<ResponseLogin> customerpurchasedetails() async {
    var url = Uri.parse(baseUrl + "/users_purchasesSelectOne/{uuid}/{prc_id}");
    var response = await http.get(url);
    print('brandlist response status: ${response.statusCode}');
    print('brandlist response body: ${response.body}');
    if (response.statusCode == 201) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    } else
      return null;
  }

  Future<ResponseLogin> customercouponslist() async {
    var url =
        Uri.parse(baseUrl + "/users_mycouponsSelectAll/{uuid}/{skp}/{lmt}");
    var response = await http.get(url);
    print('brandlist response status: ${response.statusCode}');
    print('brandlist response body: ${response.body}');
    if (response.statusCode == 201) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    } else
      return null;
  }

  Future<ResponseLogin> customercouponsdetails() async {
    var url = Uri.parse(baseUrl + "/users_purchasesSelectOne/{uuid}/{mcp_id}");
    var response = await http.get(url);
    print('brandlist response status: ${response.statusCode}');
    print('brandlist response body: ${response.body}');
    if (response.statusCode == 201) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    } else
      return null;
  }

  Future<ProfileModel> getProfile(String adm) async {
    var url = Uri.parse(baseUrl + "/admin_accountsSelectOne/$adm");
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: 'Basic ${gettoken()}',
    });
    print('Profile data ${response.statusCode}');
    if (response.statusCode == 201) {
      ProfileModel profile = profileModelFromJson(response.body);
      print(response.body);
      return profile;
    } else {
      return null;
    }
  }
}

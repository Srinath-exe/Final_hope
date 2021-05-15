import 'dart:io';

import 'package:hope/Model/BrandDetails_model.dart';
import 'package:hope/Model/BrandList_model.dart';
import 'package:hope/Model/CuponList.dart';
import 'package:hope/Model/ForgotPassword.dart';
import 'package:hope/Model/Login_model.dart';
import 'package:hope/Model/NotificationUserWise.dart';
import 'package:hope/Model/OffersList.dart';
import 'package:hope/Model/ProductlistAll.dart';
import 'package:hope/Model/PurchaseSelectAll.dart';
import 'package:hope/Model/StoreListAll.dart';
import 'package:hope/Model/WalletModel.dart';
import 'package:hope/Model/productDetails.dart';
import 'package:hope/Model/profile_model.dart';
import 'package:hope/Model/register_model.dart';
import 'package:hope/Model/tnc_mode.dart';
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

  Future<ResponseSignUp> signUp(PostRegister registermodel) async {
    var url = Uri.parse(baseUrl + "/admin_accountsCreate");
    var response = await http.post(
      url,
      body: postRegisterToJson(registermodel),
    );
    print('Singup response status: ${response.statusCode}');
    print('singup response body: ${response.body}');
    if (response.statusCode == 201) {
      try {
        ResponseSignUp responseSignUp = responseSignUpFromJson(response.body);
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('token', 'Bearer ${responseSignUp.token}');
        preferences.setString('uuid', '${responseSignUp.uuid}');

        return responseSignUp;
      } catch (e) {
        return null;
      }
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

  Future<GetBrandDetails> getbrandDetails({String brandId}) async {
    var url = Uri.parse(baseUrl + "/system_brandsSelectOne/$brandId");
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: 'Basic ${gettoken()}',
    });
    print('get Brand Detail response status: ${response.statusCode}');
    print('get Brand Detail body: ${response.body}');
    if (response.statusCode == 201) {
      GetBrandDetails getBrandDetails = getBrandDetailsFromJson(response.body);
      return getBrandDetails;
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
    if (response.statusCode == 201 || response.statusCode == 200) {
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

  Future<List<GetNotificationUserWise>> notificationuserwise(
      String uuid) async {
    var url = Uri.parse(baseUrl + "/users_notificationSelectAll/ADM2/0/100");
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: 'Basic ${gettoken()}',
    });
    print('notification response status: ${response.statusCode}');
    print('notification response body: ${response.body}');
    if (response.statusCode == 201) {
      try {
        List<GetNotificationUserWise> notificationuserwise =
            getNotificationUserWiseFromJson(response.body);
        return notificationuserwise;
      } catch (e) {
        return null;
      }
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
    print('uuid $adm');
    var url = Uri.parse(baseUrl + "/admin_accountsSelectOne/$adm");
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: 'Basic ${gettoken()}',
    });
    print('Profile data ${response.body}');
    if (response.statusCode == 201) {
      ProfileModel profile = profileModelFromJson(response.body);
      print(response.body);
      return profile;
    } else {
      return null;
    }
  }

  Future<ResponseForgotPassword> forgotPassword(
      PostForgotPassword forgotPasswordmodel) async {
    var url = Uri.parse(baseUrl + "/admin_paswrdsForgot");
    var response = await http.post(url,
        body: postForgotPasswordToJson(forgotPasswordmodel));
    print('forgotPassword response Status: ${response.statusCode}');
    print('forgotPassword response body: ${response.body}');
    if (response.statusCode == 201) {
      ResponseForgotPassword responseForgotPassword =
          responseForgotPasswordFromJson(response.body);

      return responseForgotPassword;
    } else
      return null;
  }

  Future<bool> resetPassword(PostResetPassword postResetPassword) async {
    var url = Uri.parse(baseUrl + "/admin_paswrdsReset");
    var response =
        await http.post(url, body: postResetPasswordToJson(postResetPassword));
    print('resetPassword response Status: ${response.statusCode}');
    print('resetPassword response body: ${response.body}');
    if (response.statusCode == 201) {
      if (response.body.length == 8) {
        return true;
      } else {
        return false;
      }
    } else
      return false;
  }

  Future<GetWalletDetail> getWallet(String admId) async {
    print(admId);
    var url = Uri.parse(baseUrl + "/users_purchasesSelectMy/$admId");
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: 'Basic ${gettoken()}',
    });
    print('getWallet response Status: ${response.statusCode}');
    print('getWallet response body: ${response.body}');
    if (response.statusCode == 201 || response.statusCode == 200) {
      try {
        GetWalletDetail getWallet = getWalletDetailFromJson(response.body);
        return getWallet;
      } catch (e) {
        return null;
      }
    } else
      return null;
  }
  Future<List<GetPurchasesSelectAll>> getPurchasesSelectAll(String admId) async {
 print(admId);
    var url = Uri.parse(baseUrl + "/users_purchasesSelectAll/$admId/0/100");
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: 'Basic ${gettoken()}',
      
    });
     print('Purchases Select All response Status: ${response.statusCode}');
    print('Purchases Select All response body: ${response.body}');
    if (response.statusCode == 201 ) {
      try {
        List<GetPurchasesSelectAll> purchasesSelectAll = getPurchasesSelectAllFromJson(response.body);
        return purchasesSelectAll;
      } catch (e) {
        return null;
      }
    } else
      return null;
  }
   Future<List<TncElement>> getTnC() async {
    var url = Uri.parse(baseUrl + "/admin_getTNC");
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: 'Basic ${gettoken()}',
      
    });
     print('getTnC response Status: ${response.statusCode}');
    print('getTnC  response body: ${response.body}');
    if (response.statusCode == 201 ) {
      try {
        Tnc tnc = tncFromJson(response.body);
        List<TncElement> list = tnc.tnc;
        return list;
      } catch (e) {
        return null;
      }
    } else
      return null;
  }
}

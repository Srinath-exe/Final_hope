
import 'package:hope/Model/Login_model.dart';
import 'package:hope/Model/register_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String baseUrl = 'https://hope.pustkam.com/public';
  String token='';
  Future<ResponseLogin> login(PostLogin loginModel) async {
    var url = Uri.parse(baseUrl + "/token");
    var response = await http.post(url, body: postLoginToJson(loginModel));
    print('Login response Status: ${response.statusCode}');
    print('Login response body: ${response.body}');
    if (response.statusCode == 201) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    }
     else
      return null;
  }

  Future<ResponseLogin> singup(PostRegister registermodel) async {
    var url = Uri.parse(baseUrl + "/admin_accountsCreate");
    var response =
        await http.post(url, body: postRegisterToJson(registermodel));
    print('Singup response status: ${response.statusCode}');
    print('singup response body: ${response.body}');
    if (response.statusCode == 201) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
      
    }
     else
      return null;
  }

  Future<ResponseLogin> brandlist() async {
    var url = Uri.parse(baseUrl + "/system_brandsSelectAll/{skp}/{lmt}");
    var response = await http.get(url);
    print('brandlist response status: ${response.statusCode}');
    print('brandlist response body: ${response.body}');
    if (response.statusCode == 200) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    } else
      return null;
  }

  Future<ResponseLogin> branddetails() async {
    var url = Uri.parse(baseUrl + "/system_brandsSelectOne/{brd_id}");
    var response = await http.get(url);
    print('brandlist response status: ${response.statusCode}');
    print('brandlist response body: ${response.body}');
    if (response.statusCode == 200) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    } else
      return null;
  }

  Future<ResponseLogin> productlistall() async {
    var url = Uri.parse(baseUrl + "/system_brandsSelectOne/{brd_id}");
    var response = await http.get(url);
    print('brandlist response status: ${response.statusCode}');
    print('brandlist response body: ${response.body}');
    if (response.statusCode == 200) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    } else
      return null;
  }

  Future<ResponseLogin> productdetails() async {
    var url = Uri.parse(baseUrl + "/system_brandsSelectOne/{brd_id}");
    var response = await http.get(url);
    print('brandlist response status: ${response.statusCode}');
    print('brandlist response body: ${response.body}');
    if (response.statusCode == 200) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    } else
      return null;
  }

  Future<ResponseLogin> storelistall() async {
    var url = Uri.parse(baseUrl + "/system_brandsSelectOne/{brd_id}");
    var response = await http.get(url);
    print('brandlist response status: ${response.statusCode}');
    print('brandlist response body: ${response.body}');
    if (response.statusCode == 200) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    } else
      return null;
  }

  Future<ResponseLogin> storedetail() async {
    var url = Uri.parse(baseUrl + "/system_brandsSelectOne/{brd_id}");
    var response = await http.get(url);
    print('brandlist response status: ${response.statusCode}');
    print('brandlist response body: ${response.body}');
    if (response.statusCode == 200) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    } else
      return null;
  }

  Future<ResponseLogin> notificationcount() async {
    var url = Uri.parse(baseUrl + "/system_brandsSelectOne/{brd_id}");
    var response = await http.get(url);
    print('brandlist response status: ${response.statusCode}');
    print('brandlist response body: ${response.body}');
    if (response.statusCode == 200) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    } else
      return null;
  }

  Future<ResponseLogin> notificationuserwise() async {
    var url = Uri.parse(baseUrl + "/system_brandsSelectOne/{brd_id}");
    var response = await http.get(url);
    print('brandlist response status: ${response.statusCode}');
    print('brandlist response body: ${response.body}');
    if (response.statusCode == 200) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    } else
      return null;
  }

  Future<ResponseLogin> notificationdetails() async {
    var url = Uri.parse(baseUrl + "/system_brandsSelectOne/{brd_id}");
    var response = await http.get(url);
    print('brandlist response status: ${response.statusCode}');
    print('brandlist response body: ${response.body}');
    if (response.statusCode == 200) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    } else
      return null;
  }

  Future<ResponseLogin> notificationdelete() async {
    var url = Uri.parse(baseUrl + "/system_brandsSelectOne/{brd_id}");
    var response = await http.get(url);
    print('brandlist response status: ${response.statusCode}');
    print('brandlist response body: ${response.body}');
    if (response.statusCode == 200) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    } else
      return null;
  }

  Future<ResponseLogin> offerslist() async {
    var url = Uri.parse(baseUrl + "/system_brandsSelectOne/{brd_id}");
    var response = await http.get(url);
    print('brandlist response status: ${response.statusCode}');
    print('brandlist response body: ${response.body}');
    if (response.statusCode == 200) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    } else
      return null;
  }

  Future<ResponseLogin> offersdetails() async {
    var url = Uri.parse(baseUrl + "/system_brandsSelectOne/{brd_id}");
    var response = await http.get(url);
    print('brandlist response status: ${response.statusCode}');
    print('brandlist response body: ${response.body}');
    if (response.statusCode == 200) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    } else
      return null;
  }

  Future<ResponseLogin> couponlist() async {
    var url = Uri.parse(baseUrl + "/system_brandsSelectOne/{brd_id}");
    var response = await http.get(url);
    print('brandlist response status: ${response.statusCode}');
    print('brandlist response body: ${response.body}');
    if (response.statusCode == 200) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    } else
      return null;
  }

  Future<ResponseLogin> coupondetails() async {
    var url = Uri.parse(baseUrl + "/system_brandsSelectOne/{brd_id}");
    var response = await http.get(url);
    print('brandlist response status: ${response.statusCode}');
    print('brandlist response body: ${response.body}');
    if (response.statusCode == 200) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    } else
      return null;
  }

  Future<ResponseLogin> customerpurchaseslist() async {
    var url = Uri.parse(baseUrl + "/system_brandsSelectOne/{brd_id}");
    var response = await http.get(url);
    print('brandlist response status: ${response.statusCode}');
    print('brandlist response body: ${response.body}');
    if (response.statusCode == 200) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    } else
      return null;
  }

  Future<ResponseLogin> customerpurchasedetails() async {
    var url = Uri.parse(baseUrl + "/system_brandsSelectOne/{brd_id}");
    var response = await http.get(url);
    print('brandlist response status: ${response.statusCode}');
    print('brandlist response body: ${response.body}');
    if (response.statusCode == 200) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    } else
      return null;
  }

  Future<ResponseLogin> customercouponslist() async {
    var url = Uri.parse(baseUrl + "/system_brandsSelectOne/{brd_id}");
    var response = await http.get(url);
    print('brandlist response status: ${response.statusCode}');
    print('brandlist response body: ${response.body}');
    if (response.statusCode == 200) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    } else
      return null;
  }

  Future<ResponseLogin> customercouponsdetails() async {
    var url = Uri.parse(baseUrl + "/system_brandsSelectOne/{brd_id}");
    var response = await http.get(url);
    print('brandlist response status: ${response.statusCode}');
    print('brandlist response body: ${response.body}');
    if (response.statusCode == 200) {
      ResponseLogin responseLogin = responseLoginFromJson(response.body);
      return responseLogin;
    } else
      return null;
  }
}

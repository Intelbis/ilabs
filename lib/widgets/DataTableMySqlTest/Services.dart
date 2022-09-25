import 'dart:convert';
import 'package:http/http.dart';
import 'Employee.dart';


class Services {
  static const ROOT = "http://localhost/EmployeesDB/employees_actions.php";
  static const _CREATE_TABLE_ACTION = "CREATE_TABLE";
  static const _GET_ALL_ACTION = "GET_ALL";
  static const _ADD_EMP_ACTION = "ADD_EMP";
  static const _UPDATE_EMP_ACTION  = "UPDATE_EMP";
  static const _DELETE_EMP_ACTION = "CREATE_TABLE";

  static get http => null;


  static Future<String> createTable() async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = _CREATE_TABLE_ACTION;
      final response = await http.post(ROOT, body:map);
      print('Create Table Response: ${response.body}');
      return response.body;
    } catch (e) {
      return "error";
    }
  }


  static Future<List<Employee>> getEmployees () async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_ACTION;
      final response = await http.post(ROOT, body:map);
      print('Create Table Response: ${response.body}');
      if (200 == response.statusCode) {
        List<Employee> list = parseResponse(response.body);
        return list;
      }else {
        return <Employee>[];
      }
    } catch (e) {
      return <Employee>[];
    }
  }
  static List<Employee> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String,dynamic>>();
    return parsed.map<Employee>((json)=> Employee.fromJson(json)).toList();
  }

  static Future<String> addEmployee (String firstName, String lastName) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _ADD_EMP_ACTION;
      map['first_name'] = firstName;
      map['last_name'] = lastName;
      final response = await http.post(ROOT, body:map);
      print('addEmployee Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;

      }else {
        return "error";
      }

    }catch (e) {
      return "error";
    }
  }

  static Future<String> updateEmployee(
      int empId, String firstName, String lastName) async {
    try {
      var map = Map<String, dynamic>();
      map['emp_id'] = empId;
      map['first_name'] = firstName;
      map['last_name'] = lastName;
      // final response = await http.post(ROOT,body:map);
      final response = await http(ROOT, body:map);

      print ('updateEmployee Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "Error";
      }
    } catch (e) {
      return "error";
    }
  }

  static Future<String> deleteEmployee(
      int empId, String firstName, String lastName) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _DELETE_EMP_ACTION;
      map['emp_id'] = empId;
      map['last_name'] = lastName;
      final response = await http.post(ROOT,body:map);
      print ('deleteEmployee Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "Error";
      }
    } catch (e) {
      return "error";
    }
  }

}




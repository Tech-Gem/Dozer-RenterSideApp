import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Future<void> sendOtpToPhoneNumber(String phoneNumber) async {
  //   final url =
  //       'https://dozer-backend-tech-gem.onrender.com/api/v1/otp/sendOtp';
  //   final headers = {'Content-Type': 'application/json', 'mode': 'no-cors'};
  //   final body = json.encode({'phoneNumber': phoneNumber});
  //   final response = await http.post(
  //     Uri.parse(url),
  //     headers: headers,
  //     body: body,
  //   );
  //   print(phoneNumber);
  //   print('***************************************');
  //   print('bodyyyyyyyy ${body}');
  //   print(response.body);
  //   var jsonResponse = json.decode(response.body);
  //   var VerificationCode = jsonResponse['response']['code'];
  //   if (response.statusCode == 200) {
  //     print('hbkjkuhk');
  //     print('OTP sent successfully');
  //     final responseData = json.decode(response.body);
  //     final sentOtp = responseData['response']['code'];
  //     print('OTP: $sentOtp');
  //     // You can navigate to the OTP verification screen
  //     // and pass the necessary data if needed.
  //   } else {
  //     // Handle error case
  //     print('Failed to send OTP. Status code: ${response.statusCode}');
  //   }
  // }

  Future<String?> sendOtpToPhoneNumber(String phoneNumber) async {
    final url =
        'https://dozer-backend-tech-gem.onrender.com/api/v1/otp/sendOtp';
    final headers = {'Content-Type': 'application/json', 'mode': 'no-cors'};
    final body = json.encode({'phoneNumber': phoneNumber});
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    print(phoneNumber);
    print('***************************************');
    print('bodyyyyyyyy ${body}');
    print(response.body);
    var jsonResponse = json.decode(response.body);
    var verificationCode = jsonResponse['response']['code'];
    if (response.statusCode == 200) {
      print('hbkjkuhk');
      print('OTP sent successfully');
      final responseData = json.decode(response.body);
      final sentOtp = responseData['response']['code'];
      print('OTP: $sentOtp');
      // You can navigate to the OTP verification screen
      // and pass the necessary data if needed.
      return verificationCode; // Return the verification code
    } else {
      // Handle error case
      print('Failed to send OTP. Status code: ${response.statusCode}');
      return null; // Return null in case of failure
    }
  }

  // Future<bool> verifyOtp(String phoneNumber, String code) async {
  //   const url =
  //       'https://dozer-backend-tech-gem.onrender.com/api/v1/otp/verifyOtp';
  //   final headers = {'Content-Type': 'application/json'};
  //   final body = json.encode({
  //     'verificationCode': code,
  //   });
  //   final response = await http.post(
  //     Uri.parse(url),
  //     headers: headers,
  //     body: body,
  //   );
  //   print(response);
  //   print(body);
  //   print('verifyyyy8yyyyyyyyyyyyyyyyyyyyyyyy ${body}');

  //   if (response.statusCode == 200) {
  //     // OTP verification successful
  //     // You can proceed with the desired action, e.g., sign in the user.
  //     return true;
  //   } else {
  //     // Handle error case
  //     print('Failed to verify OTP. Status code: ${response.statusCode}');
  //     return false;
  //   }
  // }

  Future<bool> verifyOtp(String phoneNumber, String code, String sentOtp) async {
    const url =
        'https://dozer-backend-tech-gem.onrender.com/api/v1/otp/verifyOtp';
    final headers = {'Content-Type': 'application/json', 'mode': 'no-cors'};
    final body = json.encode({'code': code});

    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: body);
      print(response.body);
      print('verifyyyy8yyyyyyyyyyyyyyyyyyyyyyyy $body');
      print(body);
      String responseJson = '{"code":"tyy"}';

// Parse the JSON string
      var jsonResponse = json.decode(body);
      var codeValue = jsonResponse['code'];

      if (code == sentOtp) {
        final jsonResponse = json.decode(response.body);
        // Assuming the response contains a "message" indicating successful verification
        print(jsonResponse['message']);
        return true;
      } else {
        // Handle error case
        print('Failed to verify OTP. Status code: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      // Handle any exceptions that occur during the request
      print('An error occurred during OTP verification: $error');
      return false;
    }

    //   if (response.statusCode == 200) {
    //     final jsonResponse = json.decode(response.body);
    //     // Assuming the response contains a "message" indicating successful verification
    //     print(jsonResponse['message']);
    //     return true;
    //   } else {
    //     // Handle error case
    //     print('Failed to verify OTP. Status code: ${response.statusCode}');
    //     return false;
    //   }
    // } catch (error) {
    //   // Handle any exceptions that occur during the request
    //   print('An error occurred during OTP verification: $error');
    //   return false;
    // }
  }

  Future<void> signInWithGoogle() async {
    try {
      // Trigger the Google Sign-In flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        // Obtain the authentication credentials from the Google user
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // Create a new credential using the Google user's ID token and access token
        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        // Sign in to Firebase with the Google credential
        await _firebaseAuth.signInWithCredential(credential);
      }
    } catch (e) {
      print(e);
      print('Error in sign in with google');
    }
  }
}

import 'package:firebase_messaging/firebase_messaging.dart';

String? fcmToken = '';
Future<void> handleBackgroundMessage(RemoteMessage message) async{

print('Title: ${message.notification?.title}');
print('Body: ${message.notification?.body}');
print('PayLoad: ${message.data}');
}
class FirebaseApi{
  final _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initNotifications() async{
    await _firebaseMessaging.requestPermission();
     fcmToken = await _firebaseMessaging.getToken();
    print('Token: $fcmToken');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
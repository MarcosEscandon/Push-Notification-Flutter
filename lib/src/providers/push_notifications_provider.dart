import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final _messageStreamController = StreamController<String>.broadcast();
  Stream<String> get mensajes => _messageStreamController.stream;

  initNotifications() {
    _firebaseMessaging.requestNotificationPermissions();

    _firebaseMessaging.getToken().then((token) {
      print('==== FCM Token ====');
      print(token);
      //f3E4N4lQTZaEFgTXpQJq-P:APA91bH7tlmGwg8x9vcyfsMuaReidXSG-Kl9cCm23bTbLFpCvYzsuEEr7RvvDPkhYQA38ti5IfrGwHNuWYuVI2vwY5Cr9z5q5VTD4r9--JnpeHmc1OdGGiratqe-y7C6o4aDV_vhiEQN
    });

    _firebaseMessaging.configure(
      onMessage: (info) {
        print('==== On Message ====');
        print(info);

        String argumento = 'no-data';
        if (Platform.isAndroid) {
          argumento = info['data']['comida'] ?? 'no-data';
        } else {
          argumento = info['comida'] ?? 'no-data-ios';
        }

        _messageStreamController.sink.add(argumento);
        return;
      },
      onLaunch: (info) {
        print('==== On Launch ====');
        print(info);

        String argumento = 'no-data';
        if (Platform.isAndroid) {
          argumento = info['data']['comida'] ?? 'no-data';
        } else {
          argumento = info['comida'] ?? 'no-data-ios';
        }
        _messageStreamController.sink.add(argumento);
        return;
      },
      onResume: (info) {
        print('==== On Resume ====');
        print(info);

        String argumento = 'no-data';
        if (Platform.isAndroid) {
          argumento = info['data']['comida'] ?? 'no-data';
        } else {
          argumento = info['comida'] ?? 'no-data-ios';
        }
        _messageStreamController.sink.add(argumento);
        return;
      },
    );
  }

  dispose() {
    _messageStreamController?.close();
  }
}

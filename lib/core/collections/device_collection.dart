import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_automation_app/core/collections/user_collection.dart';
import 'package:home_automation_app/core/model_classes/device.dart';

class DeviceCollection {
  static final DeviceCollection instance = DeviceCollection._internal();
  DeviceCollection._internal();
  static const deviceCollection = 'Device Collection';
  factory DeviceCollection() {
    return instance;
  }

  Future<bool> addDevice(
      {required String userId, required Device device}) async {
    try {
      await UserCollection.userCollection
          .doc(userId)
          .collection(deviceCollection)
          .doc(device.deviceId)
          .set(device.toJson());
      return true;
    } catch (e) {
      log("Error adding device: $e");
      return false;
    }
  }

  Future<bool> updateDevice(String userId, Device device) async {
    try {
      await UserCollection.userCollection
          .doc(userId)
          .collection(deviceCollection)
          .doc(device.deviceId)
          .update(device.toJson());
      return true;
    } catch (e) {
      log("Error updating device: $e");
      return false;
    }
  }

  Future<bool> deleteDevice(
      String userId, String deviceId, String deviceName) async {
    try {
      await UserCollection.userCollection
          .doc(userId)
          .collection(deviceCollection)
          .doc(deviceId)
          .delete();
      return true;
    } catch (e) {
      log("Error deleting device: $e");
      return false;
    }
  }

  Future<dynamic> getDevice(
      String userId, String deviceId, String deviceName) async {
    try {
      DocumentSnapshot deviceSnapshot = await UserCollection.userCollection
          .doc(userId)
          .collection(deviceCollection)
          .doc("0${deviceId} ${deviceName}")
          .get();
      Map<String, dynamic> deviceData =
          deviceSnapshot.data() as Map<String, dynamic>;
      return Device.fromJson(deviceData);
    } catch (e) {
      log("Error getting device: $e");
      return false;
    }
  }

  Future<List<Device>> getAllDevices(String userId) async {
    List<Device> devices = [];
    try {
      QuerySnapshot deviceSnapshot = await UserCollection.userCollection
          .doc(userId)
          .collection(deviceCollection)
          .get();
      for (var doc in deviceSnapshot.docs) {
        Map<String, dynamic> deviceData = doc.data() as Map<String, dynamic>;
        devices.add(Device.fromJson(deviceData));
      }
      return devices;
    } catch (e) {
      log("Error getting all devices: $e");
      return [];
    }
  }
}
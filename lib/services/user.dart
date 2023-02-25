import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class newUser{
  late final Timestamp eventDate;
  late final String eventName;
  late final String  eventPlace;
  late final String eventTime;
  late final String imagePath;
  late final String registrationLink; 
  late final String shortDescription;

  newUser({
    required this.eventDate,
    required this.eventName,
    required this.eventPlace,
    required this.eventTime,
    required this.imagePath,
    required this.registrationLink,
    required this.shortDescription,
  });


static newUser fromJson(Map<String,dynamic> json)=>newUser(
    eventDate: json['eventDate'],
    eventName: json['eventName'],
    eventPlace: json['eventPlace'],
    eventTime: json['eventTime'],
    imagePath: json['imagePath'],
    registrationLink: json['registrationLink'],
    shortDescription: json['shortDescription'],
  );
}
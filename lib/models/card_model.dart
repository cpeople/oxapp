import 'package:flutter/material.dart';

class CardModel {
  List<CardResults> results;

  CardModel({this.results});

  CardModel.fromJson(Map<String, dynamic> json) {
    if (json['cardResults'] != null) {
      results = List<CardResults>();
      json['cardResults'].forEach((v) {
        results.add(CardResults.fromJson(v));
      });
      //  } else if (json['walletResults'] != null) {
      //    results = List<WalletResults>();
    }
  }
}

class CardResults {
  String cardHolderName;
  String cardNumber;
  String cardMonth;
  String cardYear;
  String cardCvv;
  Color cardColor;
  String cardType;
  String cardAmount;

  CardResults(
      {this.cardHolderName,
      this.cardNumber,
      this.cardMonth,
      this.cardYear,
      this.cardCvv,
      this.cardColor,
      this.cardType,
      this.cardAmount});

  CardResults.fromJson(Map<String, dynamic> json) {
    cardHolderName = json['cardHolderName'];
    cardNumber = json['cardNumber'];
    cardMonth = json['cardMonth'];
    cardYear = json['cardYear'];
    cardCvv = json['cardCvv']; //Card Verification Number
    cardColor = json['cardColor'];
    cardType = json['cardType'];
    cardAmount = json['cardAmount'];
  }
}

class WalletResults {
  String userId;
  String cashAmount;
  String poinAmount;
  String debtAmount;
  String companyName;
  String companyLogo;
  String walletBackground;

  WalletResults(
      {this.userId,
      this.cashAmount,
      this.poinAmount,
      this.debtAmount,
      this.companyName,
      this.companyLogo,
      this.walletBackground});

  WalletResults.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    cashAmount = json['cashAmount'];
    poinAmount = json['poinAmount'];
    debtAmount = json['debtAmount'];
    companyName = json['companyName'];
    companyLogo = json['companyLogo'];
    walletBackground = json['walletBackground'];
  }
}

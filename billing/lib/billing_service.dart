import 'dart:async';

import 'package:billing/tariff_service.dart' show Tariff;
import 'package:dark_novels_io/io.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

export 'package:billing/tariff_service.dart' show Tariff;

class BillingService {
  final DarkIO io;

  BillingService(
    this.io,
  );

  Future<Response> getUserBalance() =>
      (io.newRequest('/v2/billing/balance')..get()).execute();

  Future<Response> getOtherUserBalance({
    required int id,
  }) =>
      (io.newRequest('/v2/billing/balance/:id')
            ..get()
            ..path = {
              ':id': id,
            })
          .execute();

  Future<Response> getBillingState() =>
      (io.newRequest('/v2/billing/state')..get()).execute();

  Future<Response> getOtherBillingState({
    required int id,
  }) =>
      (io.newRequest('/v2/billing/state/:id')
            ..get()
            ..path = {
              ':id': id,
            })
          .execute();

  Future<Response> createSubscription({
    required CreateSubscription model,
  }) =>
      (io.newRequest('/v2/billing/subscription')
            ..post()
            ..model = model)
          .execute();

  Future<Response> updateSubscription({
    required String key,
    required dynamic value,
  }) =>
      (io.newRequest('/v2/billing/subscription')
            ..put()
            ..model = _toMap(key, value))
          .execute();

  Map<String, dynamic> _toMap(
    String key,
    dynamic value,
  ) {
    Map<String, dynamic> t = {};
    t[key] = value;
    return t;
  }

  Future<Response> createOtherSubscription({
    required int id,
    required CreateSubscription model,
  }) =>
      (io.newRequest('/v2/billing/subscription/:id')
            ..post()
            ..path = {
              ':id': id,
            }
            ..model = model)
          .execute();

  Future<Response> createMerchantData({
    required CreateMerchantData model,
  }) =>
      (io.newRequest('/v2/billing/merchant')
            ..post()
            ..model = model)
          .execute();

  Future<Response> updatePaymentsSettings({
    required PaymentsSettings model,
  }) =>
      (io.newRequest('/v2/billing/ps')
            ..post()
            ..model = model)
          .execute();

  Future<Response> getPaymentsSettings() =>
      (io.newRequest('/v2/billing/ps')..get()).execute();

  Future<Response> getPaymentHistory() =>
      (io.newRequest('/v2/billing/payment')..get()).execute();

  Future<Response> getInvoiceHistory() =>
      (io.newRequest('/v2/billing/invoice')..get()).execute();

  Future<Response> getOtherPaymentHistory({
    required int id,
  }) =>
      (io.newRequest('/v2/billing/payment/:id')
            ..get()
            ..path = {
              ':id': id,
            })
          .execute();

  Future<Response> getOtherInvoiceHistory({
    required int id,
  }) =>
      (io.newRequest('/v2/billing/invoice/:id')
            ..get()
            ..path = {
              ':id': id,
            })
          .execute();
}

@JsonSerializable()
class PaymentsSettings extends Equatable {
  final Map<String, bool> enabled;
  final String message;

  PaymentsSettings({
    required this.enabled,
    required this.message,
  });

  List<Object?> get props => [
        this.enabled,
        this.message,
      ];

  factory PaymentsSettings.fromJson(Map<String, dynamic> json) =>
      _$PaymentsSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentsSettingsToJson(this);
}

@JsonSerializable()
class CreateMerchantData extends Equatable {
  final double amount;
  final String type;

  CreateMerchantData({
    required this.amount,
    required this.type,
  });

  List<Object?> get props => [
        this.amount,
        this.type,
      ];

  factory CreateMerchantData.fromJson(Map<String, dynamic> json) =>
      _$CreateMerchantDataFromJson(json);

  Map<String, dynamic> toJson() => _$CreateMerchantDataToJson(this);
}

@JsonSerializable()
class CreateSubscription extends Equatable {
  final int id;
  final bool prolongation;

  CreateSubscription({
    required this.id,
    required this.prolongation,
  });

  List<Object?> get props => [
        this.id,
        this.prolongation,
      ];

  factory CreateSubscription.fromJson(Map<String, dynamic> json) =>
      _$CreateSubscriptionFromJson(json);

  Map<String, dynamic> toJson() => _$CreateSubscriptionToJson(this);
}

@JsonSerializable()
@JsonSerializable()
class BillingState extends Equatable {
  final bool prolongation;
  final String revoke;
  final Tariff tariff;

  BillingState({
    required this.prolongation,
    required this.revoke,
    required this.tariff,
  });

  List<Object?> get props => [
        this.prolongation,
        this.revoke,
        this.tariff,
      ];

  factory BillingState.fromJson(Map<String, dynamic> json) =>
      _$BillingStateFromJson(json);

  Map<String, dynamic> toJson() => _$BillingStateToJson(this);
}

PaymentsSettings _$PaymentsSettingsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PaymentsSettings',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['enabled', 'message'],
        );
        final val = PaymentsSettings(
          enabled: $checkedConvert(
              'enabled', (v) => Map<String, bool>.from(v as Map)),
          message: $checkedConvert('message', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$PaymentsSettingsToJson(PaymentsSettings instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'message': instance.message,
    };

CreateMerchantData _$CreateMerchantDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CreateMerchantData',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['amount', 'type'],
        );
        final val = CreateMerchantData(
          amount: $checkedConvert('amount', (v) => (v as num).toDouble()),
          type: $checkedConvert('type', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$CreateMerchantDataToJson(CreateMerchantData instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'type': instance.type,
    };

CreateSubscription _$CreateSubscriptionFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CreateSubscription',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['id', 'prolongation'],
        );
        final val = CreateSubscription(
          id: $checkedConvert('id', (v) => v as int),
          prolongation: $checkedConvert('prolongation', (v) => v as bool),
        );
        return val;
      },
    );

Map<String, dynamic> _$CreateSubscriptionToJson(CreateSubscription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prolongation': instance.prolongation,
    };

BillingState _$BillingStateFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'BillingState',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['prolongation', 'revoke', 'tariff'],
        );
        final val = BillingState(
          prolongation: $checkedConvert('prolongation', (v) => v as bool),
          revoke: $checkedConvert('revoke', (v) => v as String),
          tariff: $checkedConvert(
              'tariff', (v) => Tariff.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$BillingStateToJson(BillingState instance) =>
    <String, dynamic>{
      'prolongation': instance.prolongation,
      'revoke': instance.revoke,
      'tariff': instance.tariff.toJson(),
    };

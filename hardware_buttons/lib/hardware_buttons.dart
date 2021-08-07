import 'dart:async';

import 'package:flutter/services.dart';

const _HARDWARE_BUTTONS_CHANNEL_NAME = 'com.the28awg.hardware_buttons';

const EventChannel _hardwareButtonsEventChannel =
    EventChannel(_HARDWARE_BUTTONS_CHANNEL_NAME);

Stream<String>? _hardwareButtonsEvents;

Stream<String> get hardwareButtonsEvents {
  return _hardwareButtonsEvents ??= _hardwareButtonsEvents =
      _hardwareButtonsEventChannel
          .receiveBroadcastStream()
          .map((dynamic event) => _eventToHardwareButtonsEvent(event));
}

String _eventToHardwareButtonsEvent(dynamic event) => event as String;

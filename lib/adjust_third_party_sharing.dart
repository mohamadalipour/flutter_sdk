//
//  adjust_third_party_sharing.dart
//  Adjust SDK
//
//  Created by Ugljesa Erceg (@uerceg) on 18th February 2021.
//  Copyright (c) 2021 Adjust GmbH. All rights reserved.
//

import 'dart:convert';

class AdjustThirdPartySharing {
  bool _isEnabled;
  var _granularOptions;

  AdjustThirdPartySharing(this._isEnabled) {
    _granularOptions = new List();
  }

  void addGranularOption(String partnerName, String key, String value) {
    if (partnerName == null || key == null || value == null) {
      return;
    }
    _granularOptions.add(partnerName);
    _granularOptions.add(key);
    _granularOptions.add(value);
  }

  Map<String, Object> get toMap {
    Map<String, Object> thirdPartySharingMap = {
      'isEnabled': _isEnabled
    };
    if (_granularOptions.length > 0) {
      thirdPartySharingMap['granularOptions'] = _granularOptions.join('__ADJ__');
    }

    return thirdPartySharingMap;
  }
}

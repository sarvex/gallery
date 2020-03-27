import 'package:flutter/material.dart';
// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';

import 'package:gallery/l10n/gallery_localizations.dart';

// BEGIN cupertinoSwitchDemo

class CupertinoSwitchDemo extends StatefulWidget {
  @override
  _CupertinoSwitchDemoState createState() => _CupertinoSwitchDemoState();
}

class _CupertinoSwitchDemoState extends State<CupertinoSwitchDemo> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        middle: Text(
          'Switch',
        ),
      ),
      child: Center(
        child: Semantics(
          container: true,
          label: 'Switch',
          child: CupertinoSwitch(
            value: _switchValue,
            onChanged: (value) {
              setState(() {
                _switchValue = value;
              });
            },
          ),
        ),
      ),
    );
  }
}

// END
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoSwitchDemo(),
    ),
  );
}
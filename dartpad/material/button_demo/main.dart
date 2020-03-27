// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:gallery/l10n/gallery_localizations.dart';

enum ButtonDemoType {
  flat,
  raised,
  outline,
  toggle,
  floating,
}

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({Key key, this.type}) : super(key: key);

  final ButtonDemoType type;

  String _title(BuildContext context) {
    switch (type) {
      case ButtonDemoType.flat:
        return 'Flat Button';
      case ButtonDemoType.raised:
        return 'Raised Button';
      case ButtonDemoType.outline:
        return 'Outline Button';
      case ButtonDemoType.toggle:
        return 'Toggle Buttons';
      case ButtonDemoType.floating:
        return 'Floating Action Button';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    Widget buttons;
    switch (type) {
      case ButtonDemoType.flat:
        buttons = _FlatButtonDemo();
        break;
      case ButtonDemoType.raised:
        buttons = _RaisedButtonDemo();
        break;
      case ButtonDemoType.outline:
        buttons = _OutlineButtonDemo();
        break;
      case ButtonDemoType.toggle:
        buttons = _ToggleButtonsDemo();
        break;
      case ButtonDemoType.floating:
        buttons = _FloatingActionButtonDemo();
        break;
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(_title(context)),
      ),
      body: buttons,
    );
  }
}

// BEGIN buttonDemoFlat

class _FlatButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FlatButton(
            child: Text('BUTTON'),
            onPressed: () {},
          ),
          SizedBox(height: 12),
          FlatButton.icon(
            icon: const Icon(Icons.add, size: 18),
            label: Text('BUTTON'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

// END

// BEGIN buttonDemoRaised

class _RaisedButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RaisedButton(
            child: Text('BUTTON'),
            onPressed: () {},
          ),
          SizedBox(height: 12),
          RaisedButton.icon(
            icon: const Icon(Icons.add, size: 18),
            label: Text('BUTTON'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

// END

// BEGIN buttonDemoOutline

class _OutlineButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OutlineButton(
            // TODO: Should update to OutlineButton follow material spec.
            highlightedBorderColor:
                Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
            child: Text('BUTTON'),
            onPressed: () {},
          ),
          SizedBox(height: 12),
          OutlineButton.icon(
            // TODO: Should update to OutlineButton follow material spec.
            highlightedBorderColor:
                Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
            icon: const Icon(Icons.add, size: 18),
            label: Text('BUTTON'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

// END

// BEGIN buttonDemoToggle

class _ToggleButtonsDemo extends StatefulWidget {
  @override
  _ToggleButtonsDemoState createState() => _ToggleButtonsDemoState();
}

class _ToggleButtonsDemoState extends State<_ToggleButtonsDemo> {
  final isSelected = <bool>[false, false, false];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ToggleButtons(
        children: [
          Icon(Icons.ac_unit),
          Icon(Icons.call),
          Icon(Icons.cake),
        ],
        onPressed: (index) {
          setState(() {
            isSelected[index] = !isSelected[index];
          });
        },
        isSelected: isSelected,
      ),
    );
  }
}

// END

// BEGIN buttonDemoFloating

class _FloatingActionButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {},
            tooltip: 'Create',
          ),
          SizedBox(height: 20),
          FloatingActionButton.extended(
            icon: const Icon(Icons.add),
            label: Text('Create'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

// END
void main() => runApp(Example());

class Example extends StatefulWidget {
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  Widget _body;

  static const String _title = 'Button Demonstration';

  @override
  void initState() {
    super.initState();
    _body = ButtonDemo(type: ButtonDemoType.flat);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.looks_one),
              onPressed: () {
                setState(() {
                  _body = ButtonDemo(type: ButtonDemoType.flat);
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.looks_two),
              onPressed: () {
                setState(() {
                  _body = ButtonDemo(type: ButtonDemoType.raised);
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.looks_3),
              onPressed: () {
                setState(() {
                  _body = ButtonDemo(type: ButtonDemoType.outline);
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.looks_4),
              onPressed: () {
                setState(() {
                  _body = ButtonDemo(type: ButtonDemoType.toggle);
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.looks_5),
              onPressed: () {
                setState(() {
                  _body = ButtonDemo(type: ButtonDemoType.floating);
                });
              },
            ),
          ],
        ),
        body: _body,
      ),
    );
  }
}
import 'package:command/command/index.dart';
import 'package:command/widgets/layout_constants.dart';
import 'package:command/widgets/platform_button.dart';
import 'package:flutter/material.dart';


import 'command_history_column.dart';
import 'shape_container.dart';

class CommandExample extends StatefulWidget {
  const CommandExample();

  @override
  _CommandExampleState createState() => _CommandExampleState();
}

class _CommandExampleState extends State<CommandExample> {
  final CommandHistory _commandHistory = CommandHistory();
  final Shape _shape = Shape.initial();

  void _changeColor() {
    final command = ChangeColorCommand(_shape);
    _executeCommand(command);
  }

  void _changeHeight() {
    final command = ChangeHeightCommand(_shape);
    _executeCommand(command);
  }

  void _changeWidth() {
    final command = ChangeWidthCommand(_shape);
    _executeCommand(command);
  }

  void _executeCommand(Command command) {
    setState(() {
      command.execute();
      _commandHistory.add(command);
    });
  }

  void _undo() {
    setState(() {
      _commandHistory.undo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Command pattern demo", style: TextStyle(
          color: Colors.black
        ),),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: LayoutConstants.paddingL,
          ),
          child: Column(
            children: <Widget>[
              ShapeContainer(
                shape: _shape,
              ),
              const SizedBox(height: LayoutConstants.spaceM),
              PlatformButton(
                materialColor: Colors.black,
                materialTextColor: Colors.white,
                onPressed: _changeColor,
                text: 'Change color',
              ),
              PlatformButton(
                materialColor: Colors.black,
                materialTextColor: Colors.white,
                onPressed: _changeHeight,
                text: 'Change height',
              ),
              PlatformButton(
                materialColor: Colors.black,
                materialTextColor: Colors.white,
                onPressed: _changeWidth,
                text: 'Change width',
              ),
              const Divider(),
              PlatformButton(
                materialColor: Colors.black,
                materialTextColor: Colors.white,
                onPressed: _commandHistory.isEmpty ? null : _undo,
                text: 'Undo',
              ),
              const SizedBox(height: LayoutConstants.spaceM),
              Row(
                children: <Widget>[
                  CommandHistoryColumn(
                    commandList: _commandHistory.commandHistoryList,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

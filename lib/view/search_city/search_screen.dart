import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _controller;
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();

    Future.delayed(
        Duration.zero, (() => setState(() => _focusNode.requestFocus())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find a city'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                focusNode: _focusNode,
                decoration: InputDecoration(hintText: 'Find a city'),
              ),
              SizedBox(height: 8),
              MaterialButton(
                height: 44,
                minWidth: double.infinity,
                child: Text('Done'),
                onPressed: () => Navigator.of(context).pop(_controller.text),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    FocusScope.of(context).requestFocus();
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }
}

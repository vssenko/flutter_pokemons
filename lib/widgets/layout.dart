import 'dart:async';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  final bool addSearch;
  final Function(String?)? onSearch;
  final String titleText;
  final Widget content;

  const MainLayout(
      {Key? key,
      required this.titleText,
      required this.content,
      this.addSearch = false,
      this.onSearch})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainLayoutState();
  }
}

class _MainLayoutState extends State<MainLayout> {
  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  Timer? _debounce;

  _MainLayoutState();

  Widget _buildSearchField(BuildContext context) {
    return TextField(
      controller: _searchQueryController,
      autofocus: true,
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: _onSearchChanged,
    );
  }

  _cancelTimer() {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }
  }

  _onSearchChanged(text) {
    _cancelTimer();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      _fireOnSearch(text);
    });
  }

  _fireOnSearch(text) {
    if (widget.onSearch != null) {
      widget.onSearch!(text);
    }
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: _closeSearch,
        ),
      ];
    } else {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: _openSearch,
        ),
      ];
    }
  }

  void _openSearch() {
    setState(() {
      _searchQueryController.clear();
      _isSearching = true;
    });
  }

  void _closeSearch() {
    setState(() {
      _searchQueryController.clear();
      _isSearching = false;
    });
    _cancelTimer();
    _fireOnSearch(null);
  }

  Widget _buildTitle(BuildContext context) {
    return Text(widget.titleText);
  }

  _buildAppBar() {
    if (!widget.addSearch) {
      return AppBar(title: Text(widget.titleText));
    }

    return AppBar(
      leading: _isSearching ? const BackButton() : Container(),
      title: _isSearching ? _buildSearchField(context) : _buildTitle(context),
      actions: _buildActions(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: widget.content,
    );
  }
}

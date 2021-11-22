import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_dictionary/base/base_controller.dart';
import 'package:media_dictionary/data/data.dart';
import 'package:media_dictionary/data/data_model.dart';

class MainController extends BaseController with SingleGetTickerProviderMixin {
  late TabController tabController;
  int limit = 10;
  int _currentPage = 1;
  final ScrollController scrollController = ScrollController();

  String _currentTab = 'A';

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: alphabet.length, vsync: this);
  }

  void setTab(int index) {
    _currentTab = alphabet[index];
    _currentPage = 1;
    update();
  }

  setCurrentPage(int value) {
    _currentPage = value;
    update();
  }

  Future<List<DataModel>> search(String search) async {
    await Future.delayed(const Duration(milliseconds: 500));
    List<DataModel> _list = [];
    for (var element in DictionaryData.data.values) {
      for (var e in element) {
        if (e.title.toLowerCase().contains(search.toLowerCase())) {
          _list.add(e);
        }
      }
    }
    return _list;
  }

  List<DataModel> get list => DictionaryData.data[_currentTab] ?? [];

  int get currentPage => _currentPage;
}

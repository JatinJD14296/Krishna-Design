import 'dart:async';
import 'package:krishna_design/networks/db_data.dart';
import 'package:rxdart/rxdart.dart';

class SubcategoryPageBloc {
  StreamController<bool> subcategoryPageLoadingController =
      BehaviorSubject<bool>();
  StreamController<List<String>> subcategoryListController =
      BehaviorSubject<List<String>>();

  Stream<bool> get subcategoryPageLoadingStream =>
      subcategoryPageLoadingController.stream;

  Stream<List<String>> get subcategoryListStream =>
      subcategoryListController.stream;

  Sink<bool> get subcategoryPageLoadingSink =>
      subcategoryPageLoadingController.sink;

  Sink<List<String>> get subcategoryListSink => subcategoryListController.sink;

  getSubcategoryPageLoading(bool data) {
    subcategoryPageLoadingSink.add(data);
  }

  getSubcategoryList({String data = '', String categoryType = ''}) {
    if (data != '') subcategories[categoryType].add(data);
    subcategoryListSink.add(subcategories[categoryType]);
  }

  void dispose() {
    subcategoryPageLoadingController.close();
    subcategoryListController.close();
  }
}

final SubcategoryPageBloc subcategoryPageBloc = SubcategoryPageBloc();

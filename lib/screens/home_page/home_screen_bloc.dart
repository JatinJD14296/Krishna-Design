import 'dart:async';
import 'package:krishna_design/networks/db_data.dart';
import 'package:rxdart/rxdart.dart';

class HomepageBloc {
  StreamController<bool> homepageLoadingController = BehaviorSubject<bool>();
  StreamController<List<String>> categoriesListController =
      BehaviorSubject<List<String>>();

  Stream<bool> get homepageLoadingStream => homepageLoadingController.stream;

  Stream<List<String>> get categoriesListStream =>
      categoriesListController.stream;

  Sink<bool> get homepageLoadingSink => homepageLoadingController.sink;

  Sink<List<String>> get categoriesListSink => categoriesListController.sink;

  getHomepageLoading(bool data) {
    homepageLoadingSink.add(data);
  }

  getCategoriesList({String data=''}) {
    if (data != '') categories.add(data);
    categoriesListSink.add(categories);
  }

  void dispose() {
    homepageLoadingController.close();
    categoriesListController.close();
  }
}

final HomepageBloc homepageBloc = HomepageBloc();

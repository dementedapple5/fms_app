import 'package:flutter/material.dart';
import 'package:fms_app/src/scoped_models/main_page_model.dart';
import 'package:fms_app/src/ui/home_page.dart';
import 'package:fms_app/src/ui/profile_page.dart';
import 'package:fms_app/src/ui/tournaments_page.dart';
import 'package:scoped_model/scoped_model.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pageController = PageController();
  MainPageModel _mainPageModel;
  
  final pages = [HomePage(), TournamentsPage(), ProfilePage()];

  @override
  void initState() {
    super.initState();
    _mainPageModel = MainPageModel();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainPageModel>(
      model: _mainPageModel,
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            itemBuilder: (context, index) {
              return pages[_mainPageModel.currentPage];
            }),
        bottomNavigationBar: ScopedModelDescendant<MainPageModel>(builder: (context, child, model) {
          return BottomNavigationBar(items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Inicio')),
            BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('Buscar')),
            BottomNavigationBarItem(icon: Icon(Icons.mic), title: Text('Torneos')),
            BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Perfil')),
          ],
            currentIndex: model.currentPage,
            onTap: (index) {
              pageController.jumpToPage(index);
              model.changePage(index);
            },
          );
        })
      ),
    );
  }
}

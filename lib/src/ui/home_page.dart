import 'package:flutter/material.dart';
import 'package:fms_app/src/models/mc.dart';
import 'package:fms_app/src/models/scoped_models/mc_model.dart';
import 'package:fms_app/src/repositories/mc_repository.dart';
import 'package:scoped_model/scoped_model.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  McRepository _mcRepo;
  McModel _mcModel;
  
  @override
  void initState() {
    _mcRepo = McRepository();
    _mcModel = McModel(_mcRepo);
    _mcModel.loadMcData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<McModel>(
        model: _mcModel,
        child: Scaffold(
          appBar: AppBar(title: Text(widget.title)),
          body: SafeArea(
            child: ScopedModelDescendant<McModel>(builder: (context, child, model) {
              if (model.isLoading) {
                return _buildLoading();
              }
              else {
                if (model.mc != null) {
                  return _buildMcInfo(model.mc);
                }
              }
            }),
          )
        )
    );
  }
  
  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  
  Widget _buildMcInfo(Mc mc) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: NetworkImage(mc.posterPath), fit: BoxFit.fill),
            ),
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 20.0)),
          Text(mc.name, style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w600))
        ],
      ),
    );
  }
  
}

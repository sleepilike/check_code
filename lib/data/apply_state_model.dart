import 'package:flutter/cupertino.dart';
import 'package:registration_admin/data/apply_repo.dart';
import 'package:registration_admin/entity/apply_entity.dart';

class ApplyStateModel extends ChangeNotifier{
  bool _state = false ;
  ApplyEntity _applyEntity;
  List _startsp;
  List _endsp;
  List _applysp;


  get state => _state;
  get applyEntity => _applyEntity;
  get startsp => _startsp;
  get endsp => _endsp;
  get applysp => _applysp;

  init(id) async{
    try{
      _applyEntity = await ApplyRepo().getApply(id);
      String start = applyEntity.startTime.substring(0,10);
      _startsp = start.split("-");
      String end = applyEntity.endTime.substring(0,10);
      _endsp = end.split("-");
      String apply = applyEntity.applyTime.substring(0,10);
      _applysp = apply.split("-");
      _state = true;
      notifyListeners();
    }catch(error){
      print("ApplyStateModel init eeror"+error.toString());
    }
  }
}
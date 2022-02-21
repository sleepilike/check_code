import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registration_admin/data/apply_repo.dart';
import 'package:registration_admin/data/apply_state_model.dart';
import 'package:registration_admin/entity/apply_entity.dart';
import 'package:registration_admin/ui/mainpage/widget/autoResizeWidget.dart';

class DetailPage extends StatefulWidget {

  int applicationId;
  DetailPage(this.applicationId);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  ApplyEntity applyEntity;



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ApplyStateModel>(
      create: (BuildContext context) =>ApplyStateModel()..init(widget.applicationId),
      child: Consumer<ApplyStateModel>(
        builder: (BuildContext context,ApplyStateModel value,Widget child){

          return AutoResizeWidget(
            child: Scaffold(
              //type:MaterialType.transparency,
              body: value.state == true?SizedBox(
                child: Container(
                  margin: EdgeInsets.only(top: 20.0),
                  padding: EdgeInsets.all(10.0),
                  color: Colors.white,
                  width: double.infinity,
                  child:Column(
                    children: [
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                info(Icons.person, "申请人", value.applyEntity.applicant),
                                info(Icons.star, "出差原因", value.applyEntity.reason),
                                info(Icons.person, "随行人员", value.applyEntity.accompany),
                                info(Icons.attach_money, "经费来源", value.applyEntity.fundsFrom),
                                info(Icons.timer, "出发时间", "${value.startsp[0]}年${value.startsp[1]}月${value.startsp[2]}日"),
                                info(Icons.timer, "结束时间", "${value.endsp[0]}年${value.endsp[1]}月${value.endsp[2]}日"),
                                info(Icons.place, "出发地", value.applyEntity.departure),
                                info(Icons.place, "目的地", value.applyEntity.destination),
                                info(Icons.directions_bus, "交通方式", value.applyEntity.transport==null?"无":value.applyEntity.transport),
                                info(Icons.directions_bus, "超标原因", value.applyEntity.transportBeyond==null?"无":value.applyEntity.transportBeyond),
                                lastStatusWidget(value.applyEntity),
                                currentStatusWidget(value.applyEntity),
                                info(Icons.timer, "提交时间", "${value.applysp[0]}年${value.applysp[1]}月${value.applysp[2]}日"),
                              ],
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ):Container(),
            ),
          );
        },
      ),
    );
  }
  Widget info(IconData iconData,String title,String info){
    return Container(
      //padding: EdgeInsets.all(10.0),
      height: 50.0,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              //Container(width: 10.0,),
              Container(width: 20.0,child: Icon(iconData,color: Colors.grey,size: 20,),),
              Container(width: 10.0,),
              Container(
                child: Text('${title}',style: TextStyle(fontSize: 18),),
              ),
              Container(width: 10.0,),
            ],
          ),
          Container(
              width: 230.0,
              alignment: Alignment.centerRight,
              child:AutoSizeText("${info} ",style: TextStyle(color: Colors.grey,fontSize: 18),maxLines: 2,)
          )
        ],
      ),
    );
  }
  Widget lastStatusWidget(ApplyEntity applyEntity){
    return applyEntity.status!=1?Container(
      //padding: EdgeInsets.all(10.0),
      height: 50.0,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              //Container(width: 10.0,),
              Container(width: 20.0,child: Icon(Icons.check,color: Colors.grey,size: 18,),),
              Container(width: 10.0,),
              Container(
                child: Text('上一状态',style: TextStyle(fontSize: 18),),
              ),
            ],
          ),
          applyEntity.status==0?Container(child: Row(
            children: [
              Text("等待",style: TextStyle(color: Colors.grey,fontSize: 18),),
              Text(" ${applyEntity.advise} ",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 18),),
              Text("审核 ",style: TextStyle(color: Colors.grey,fontSize: 18),),
            ],
          ),):applyEntity.status==2?Container(child: Row(
            children: [
              Text("已通过",style: TextStyle(color: Colors.grey,fontSize: 18),),
              Text(" ${applyEntity.advise} ",style: TextStyle(color: Colors.redAccent,fontSize: 18,),),
              Text("审核 ",style: TextStyle(color: Colors.grey,fontSize: 18),),
            ],
          ),):applyEntity.status==3?Container(child: Row(
            children: [
              Text(" ${applyEntity.advise} ",style: TextStyle(color:  Colors.redAccent,fontSize: 18),),
              Text("审核未通过 ",style: TextStyle(color: Colors.grey,fontSize: 18),),
            ],
          ),):applyEntity.status==4?Container(child: Row(
            children: [
              Text("已通过",style: TextStyle(color: Colors.grey,fontSize: 18),),
              Text(" ${applyEntity.approval} ",style: TextStyle(color:  Colors.redAccent,fontSize: 18),),
              Text("审核 ",style: TextStyle(color: Colors.grey,fontSize: 18),),
            ],
          ),):Container(child: Row(
            children: [
              Text(" ${applyEntity.advise} ",style: TextStyle(color:  Colors.redAccent,fontSize: 18),),
              Text("审核未通过 ",style: TextStyle(color: Colors.grey,fontSize: 18),),
            ],
          ),)
        ],
      ),
    ):Container();
  }
  Widget currentStatusWidget(ApplyEntity applyEntity){
    return Container(
      //padding: EdgeInsets.all(10.0),
      height: 50.0,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              //Container(width: 10.0,),
              Container(width: 20.0,child: Icon(Icons.check,color: Colors.grey,size: 18,),),
              Container(width: 10.0,),
              Container(
                child: Text('当前状态',style: TextStyle(fontSize: 18),),
              ),
            ],
          ),
          applyEntity.status==0?Container(child: Row(
            children: [
              Text("等待",style: TextStyle(color: Colors.grey,fontSize: 18),),
              Text(" ${applyEntity.advise} ",style: TextStyle(color: Colors.orange,fontSize: 18),),
              Text("审核 ",style: TextStyle(color: Colors.grey,fontSize: 18),),
            ],
          ),):applyEntity.status==2?Container(child: Row(
            children: [
              Text("等待",style: TextStyle(color: Colors.grey,fontSize: 18),),
              Text(" ${applyEntity.approval} ",style: TextStyle(color:  Colors.orange,fontSize: 18),),
              Text("审核 ",style: TextStyle(color: Colors.grey,fontSize: 18),),
            ],
          ),):applyEntity.status==3?Container(child: Row(
            children: [
              Text("等待",style: TextStyle(color: Colors.grey,fontSize: 18),),
              Text(" ${applyEntity.approval} ",style: TextStyle(color:  Colors.orange,fontSize: 18),),
              Text("审核 ",style: TextStyle(color: Colors.grey,fontSize: 18),),
            ],
          ),):applyEntity.status==4?Container(child: Row(
            children: [
              Text("审核成功 ",style: TextStyle(color: Colors.grey,fontSize: 18),),
            ],
          ),):applyEntity.status==1?Container(child: Row(
            children: [
              Text("已作废 ",style: TextStyle(color: Colors.grey,fontSize: 18),),
            ],
          )):Container(child: Row(
            children: [
              Text("审核失败 ",style: TextStyle(color: Colors.grey,fontSize: 18),),
            ],
          ),)
        ],
      ),
    );
  }
}

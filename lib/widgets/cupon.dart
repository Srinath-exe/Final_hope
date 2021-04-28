import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CuponCard extends StatefulWidget {
  String name;
   String no; 
   String amount; 
   double points;
   CuponCard({this.name, this.no, this.amount, this.points});
  @override
  _CuponCardState createState() => _CuponCardState();
}

class _CuponCardState extends State<CuponCard> {
  
  @override
  Widget build(BuildContext context) {
     num max = 1000;
    num rest = max - widget.points;
    int point = widget.points.toInt();
    int more = rest.toInt();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: MediaQuery.of(context).size.height * 0.23,
          width: MediaQuery.of(context).size.width * 0.95,
          decoration: BoxDecoration(
            color: Colors.orange[200],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60),
               bottomRight: Radius.circular(60),
                topRight: Radius.circular(20),
                 bottomLeft: Radius.circular(20),
            ),
             boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width * 0.9 * 0.45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.19,
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: SfRadialGauge(axes: <RadialAxis>[
                        RadialAxis(
                            startAngle: 270,
                            endAngle: 270,
                            minimum: 0,
                            maximum: 1000,
                            showLabels: false,
                            showTicks: false,
                            axisLineStyle: AxisLineStyle(
                              thickness: 2,
                              color: Colors.white,
                              thicknessUnit: GaugeSizeUnit.factor,
                            ),
                            pointers: <GaugePointer>[
                              RangePointer(
                                value: widget.points,
                                width: 0.15,
                                color: Colors.green,
                                pointerOffset: 0.1,
                                cornerStyle: CornerStyle.bothCurve,
                                sizeUnit: GaugeSizeUnit.factor,
                              )
                            ],
                            annotations: <GaugeAnnotation>[
                              GaugeAnnotation(
                                  positionFactor: 0.5,
                                  angle: 90,
                                  widget:
                                      Text(widget.points.toStringAsFixed(0) + ' / 1000',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                          )))
                            ])
                      ]),
                    ),
                    Text(widget.name,
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: MediaQuery.of(context).size.height * 0.2,
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                       
                              Column(
                                children: [
                                  Text('$point Points',
                                      style: TextStyle(
                                      
                                          fontSize: 30,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700)),
                             
                          
                          Text('$more more coins to next reward',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),   ],
                              ),
                            
                       
                          
                             Column(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height * 0.045,
                                  width: MediaQuery.of(context).size.width * 0.25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Text(widget.amount,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600)),
                                  ),),
                           
                          Text(widget.no,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800)),
                                     
                              ],
                            ),
                          
                        ],
                      ))
                ],
              )
            ],
          )),
    );
      
    
  }
}
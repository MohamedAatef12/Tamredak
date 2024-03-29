import 'package:flutter/material.dart';

double getScaleFactor(BuildContext context){
  double contextWidth = MediaQuery.of(context).size.width;
  if(contextWidth < 600) {
    return contextWidth/300;
  }
  else if( contextWidth < 900){
    return contextWidth/600;
  }
  else{
    return contextWidth/1000;
  }
}

double getScaleFactorLogo(BuildContext context){
  double contextWidth = MediaQuery.of(context).size.width;
  if(contextWidth < 600) {
    return contextWidth/250;
  }
  else if( contextWidth < 900){
    return contextWidth/700;
  }
  else{
    return contextWidth/1400;
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


 push(context,nameview){
  Navigator.of( context).push(MaterialPageRoute(builder: (context) => nameview,));
}

pushReplacement(context,nameview){
 Navigator.of( context).pushReplacement(MaterialPageRoute(builder: (context) => nameview,));
}

pushAndRemoveUntil(context,nameview){
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => nameview), (route) => false);
}
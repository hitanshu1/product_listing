
import 'package:flutter/material.dart';

import 'Widgets/Widgets.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Test Page'),
      ),
      body: Column(
        children: <Widget>[
          TxtField(text: '', hintText: 'kk', onChanged: (val){

          }),
            TxtField(text: '', hintText: 'kk', onChanged: (val){
            
          }),
            TxtField(text: '', hintText: 'kk', onChanged: (val){
            
          }),
            TxtField(text: '', hintText: 'kk', onChanged: (val){
            
          }),
            TxtField(text: '', hintText: 'kk', onChanged: (val){
            
          }),
            TxtField(text: '', hintText: 'kk', onChanged: (val){
            
          }),
           TxtField(text: '', hintText: 'kk', onChanged: (val){
            
          }),
           TxtField(text: '', hintText: 'kk', onChanged: (val){
            
          }),
           TxtField(text: '', hintText: 'kk', onChanged: (val){
            
          }),
           TxtField(text: '', hintText: 'kk', onChanged: (val){
            
          })
        ],
      ),
    );
  }
}
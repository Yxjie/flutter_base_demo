import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PhotoPageState();
  }
}

class _PhotoPageState extends State<PhotoPage> {
  List<File> _images = [];

  Future getImage(bool isTakePhoto) async {
    //隐藏底部弹框
    Navigator.pop(context);
    var image = await ImagePicker.pickImage(
        source: isTakePhoto ? ImageSource.camera : ImageSource.gallery);

    if (image == null) {
      throw Exception('File is not available');
    }

    setState(() {
      _images.add(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "拍照App开发",
      home: Scaffold(
        appBar: AppBar(
          title: Text("拍照App开发"),
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: () => Navigator.pop(context),
          ),
        ),
        body: Center(
          child: _images.length == 0
              ? Text("没有photo展示")
              : Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: _genImages(),
                ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _pickImage,
          tooltip: '选择图片',
          child: Icon(Icons.add_a_photo),
        ),
      ),
    );
  }

  //选择图片
  _pickImage() {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              height: 200,
              child: Column(
                children: <Widget>[
                  _itemBtn("拍照", true),
                  _itemBtn("选择照片", false),
                ],
              ),
            ));
  }

  //底部弹框布局item
  _itemBtn(String title, bool isTakePhoto) {
    return GestureDetector(
      child: ListTile(
        leading: Icon(isTakePhoto ? Icons.camera_alt : Icons.photo_library),
        title: Text(title),
        onTap: () => getImage(isTakePhoto),
      ),
    );
  }

  //生成图片
  _genImages() {
    return _images.map((file) {
      return Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.file(
              file,
              width: 120,
              height: 90,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
              top: 5,
              right: 5,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _images.remove(file);
                  });
                },
                child: ClipOval(
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(color: Colors.black54),
                    child: Icon(
                      Icons.close,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ))
        ],
      );
    }).toList();
  }
}

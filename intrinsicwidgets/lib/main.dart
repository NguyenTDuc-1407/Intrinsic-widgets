// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DetailTaskHistoryScreen(),
    );
  }
}

class DetailTaskHistoryScreen extends StatelessWidget {
  DetailTaskHistoryScreen({super.key});

  List time = [
    {
      "date": "07/01/2022",
      "detail": [
        {
          "time": "10:42",
          "context": "Chỉnh sửa giao diện",
          "name": "Phùng Đức Trung",
          "status": "",
        },
        {
          "time": "11:42",
          "context": "Chỉnh sửa giao diện",
          "name": "Phùng Đức Trung",
          "status": "",
        }
      ]
    },
    {
      "date": "06/01/2022",
      "detail": [
        {
          "time": "10:43",
          "context": "Chỉnh sửa giao diện",
          "name": "Phùng Đức Trung",
          "status": "Đã hoàn thành",
        }
      ]
    },
    {
      "date": "05/01/2022",
      "detail": [
        {
          "time": "10:44",
          "context": "Chỉnh sửa giao diện",
          "name": "Phùng Đức Trung",
          "status": "Đã release QC",
        },
        {
          "time": "10:44",
          "context": "Chỉnh sửa giao diện",
          "name": "Phùng Đức Trung",
          "status": "Đã release QC",
        }
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: time.length,
          itemBuilder: (context, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xff0063E2),
                ),
                child: Text(
                  time[index]["date"],
                  style: TextStyle(color: Colors.white),
                ),
              ),
              IntrinsicHeight(
                child: Container(
                  margin: EdgeInsets.only(left: 35, right: 20),
                  child: Row(
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                              ),
                            ),
                          ),
                          Container(
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.red),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          ...List.generate(
                            time[index]["detail"].length,
                            (indexs) => Container(
                              padding: EdgeInsets.all(15),
                              margin: EdgeInsets.only(
                                  bottom: 10, top: 10, left: 10),
                              width: screenWidth * 0.8,
                              color: Color(0xffF5F9FE),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: time[index]["detail"][indexs]
                                          ["time"],
                                      style:
                                          TextStyle(color: Color(0xff6F7A8A)),
                                      children: [
                                        TextSpan(text: ", "),
                                        TextSpan(
                                          text: time[index]["date"],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    time[index]["detail"][indexs]["context"],
                                    style: TextStyle(
                                        color: Color(0xff1B2C43),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "Cập nhật bởi ",
                                      style:
                                          TextStyle(color: Color(0xff6F7A8A)),
                                      children: [
                                        TextSpan(
                                            text: time[index]["detail"][indexs]
                                                ["name"],
                                            style: TextStyle(
                                                color: Color(0xff1B2C43),
                                                fontWeight: FontWeight.w600))
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  time[index]["detail"][indexs]["status"]
                                          .toString()
                                          .isNotEmpty
                                      ? Text(
                                          time[index]["detail"][indexs]
                                              ["status"],
                                          style: TextStyle(
                                              color: Color(0xff1B2C43),
                                              fontWeight: FontWeight.w600),
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(bottom: 20, right: 10, left: 10),
            height: screenHeight * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xff0063E2),
            ),
            child: Center(
              child: Text(
                "Thêm lịch sử",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';

class Disease extends StatelessWidget {
  Disease({Key? key}) : super(key: key);

  final List<String> _typeDetail = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.all(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'ลักษณะอาการ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Center(
            child: Container(
                // height: 550,
                // width: 400,
                alignment: Alignment.topCenter,
                //margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.green[600],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  '\t\t\t อาการของโรค จะพบแผลสีต่าง ๆ เช่น เป็นจุดสีน้ำตาลหรือดำ หรือมีลายสีน้ำตาลดำ หรือสีเทาปนชมพูที่เมล็ดบนรวงข้าว เพราะมีเชื้อราหลายชนิดที่สามารถเข้าทำลาย การเข้าทำลายของเชื้อรามักจะเกิดในช่วงดอกข้าวเริ่มโผล่จากกาบหุ้มรวง  จนถึงระยะเมล็ดข้าวเริ่มเป็นน้ำนม และอาการเมล็ดด่าง จะเห็นได้เด่นชัดในระยะใกล้เก็บเกี่ยว เชื้อราสามารถแพร่กระจายไปกับลมหรือติดไปกับเมล็ดพันธุ์ข้าว ซึ่งการระบาดจะสัมพันธ์กับโรคของต้นข้าวในระยะก่อนออกรวง เช่น โรคใบจุดสีน้ำตาล โรคใบขีดสีน้ำตาล และโรคไหม้ เป็นต้น นอกจากนี้จะพบช่วงข้าวออกรวงในสภาพอุณหภูมิ ต่ำกว่า 20 องศาเซลเซียล ทำให้รวงข้าวยืดออกไม่สุดรวง เมื่อสภาพอากาศมีอุณหภูมิสูงขึ้นจะทำให้ข้าวเป็นโรคเมล็ดด่าง',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

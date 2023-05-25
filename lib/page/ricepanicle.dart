import 'package:flutter/material.dart';
import 'package:flutter_rice_classification/page/factor.dart';
import 'package:flutter_rice_classification/page/rice_seed_disease.dart';

class RicePanicle extends StatefulWidget {
  const RicePanicle({Key? key}) : super(key: key);

  @override
  State<RicePanicle> createState() => _RicePanicleState();
}

class _RicePanicleState extends State<RicePanicle>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 70,
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Text(
              "สาเหตุ ลักษณะอาการ และการป้องกัน",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            height: 70,
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.grey),
              ),
              child: TabBar(
                physics: const ClampingScrollPhysics(),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey,
                ),
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "สาเหตุ",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "ลักษณะอาการ",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "การป้องกัน",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
                controller: _tabController,
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController, // เพิ่ม controller ที่นี่
              children: [
                Factor(), // เปลี่ยนเป็นหน้าจอที่ต้องการแสดงผลในแท็บ "สาเหตุ"
                Disease(), // เปลี่ยนเป็นหน้าจอที่ต้องการแสดงผลในแท็บ "ลักษณะอาการ"
                // หน้าจออื่น ๆ ที่คุณต้องการแสดงผลในแท็บอื่น ๆ
              ],
            ),
          ),
        ],
      ),
    );
  }
}

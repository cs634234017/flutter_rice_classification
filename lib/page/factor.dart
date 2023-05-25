import 'package:flutter/material.dart';

class Factor extends StatefulWidget {
  const Factor({super.key});

  @override
  State<Factor> createState() => _FactorState();
}

class _FactorState extends State<Factor> {
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
                'สาเหตุ',
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
                height: 550,
                width: 400,
                alignment: Alignment.topCenter,
                //margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.green[600],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "โรคเมล็ดด่าง หรือโรคเมล็ดลาย (Dirty panicle disease) ในนาข้าว มีสาเหตุเกิดจากเชื้อราหลายชนิด ที่พบมากมีเชื้อราประมาณ 6 ชนิด ได้แก่ Curvularia lunata, Cercospora oryzae, Bipolaris oryzae, Fusarium semitectum, Trichoconis padwickii, Sarocladium oryzae ซึ่งสามารถพบการระบาดของโรคได้ทั่วทุกภาคของประเทศไทยและทุกฤดูการเพาะปลูก เกษตรกรควรหมั่นเฝ้าสังเกตอาการของโรค หรือพ่นสารป้องกันกำจัดโรคพืชป้องกันไว้ก่อน",
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

import 'package:flutter/material.dart';

class SecondTab extends StatelessWidget {
  final double _smallFontSize = 12;
  final double _valFontSize = 30;
  final FontWeight _smallFontWeight = FontWeight.w500;
  final FontWeight _valFontWeight = FontWeight.w700;
  final Color _fontColor = Color(0xff5b6990);
  final double _smallFontSpacing = 1.3;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      alignment: Alignment.topCenter,
      child: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Average Sleep",
                    style: TextStyle(
                      fontWeight: _smallFontWeight,
                      fontSize: _smallFontSize,
                      letterSpacing: _smallFontSpacing,
                      color: _fontColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "5.45h",
                    style: TextStyle(
                      fontWeight: _valFontWeight,
                      fontSize: _valFontSize,
                      letterSpacing: _smallFontSpacing,
                      color: _fontColor,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Average Work",
                    style: TextStyle(
                      fontWeight: _smallFontWeight,
                      fontSize: _smallFontSize,
                      letterSpacing: _smallFontSpacing,
                      color: _fontColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "8.20h",
                    style: TextStyle(
                      fontWeight: _valFontWeight,
                      fontSize: _valFontSize,
                      letterSpacing: _smallFontSpacing,
                      color: _fontColor,
                    ),
                  ),
                ],
              ),
              Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Color(0xfff0f5fb),
                    border: Border.all(
                      width: 8,
                      color: Color(0xffd3e1ed),
                    ),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "This Week",
                        style: TextStyle(
                            fontSize: _smallFontSize,
                            fontWeight: _smallFontWeight,
                            letterSpacing: _smallFontSpacing,
                            color: _fontColor),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 120,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        width: double.infinity,
                        child: CustomPaint(
                          foregroundPainter: GraphPainter(),
                        ),
                      )
                    ],
                  ))
            ],
          ),
          SizedBox(
            height: 25,
          ),
          RecordItem(
              smallFontSpacing: _smallFontSpacing,
              fontColor: _fontColor,
              day: "Sunday"),
          RecordItem(
              smallFontSpacing: _smallFontSpacing,
              fontColor: _fontColor,
              day: "Monday"),
          RecordItem(
              smallFontSpacing: _smallFontSpacing,
              fontColor: _fontColor,
              day: "Tuesday"),
          RecordItem(
              smallFontSpacing: _smallFontSpacing,
              fontColor: _fontColor,
              day: "Wednesday"),
          RecordItem(
              smallFontSpacing: _smallFontSpacing,
              fontColor: _fontColor,
              day: "Thursday"),
          RecordItem(
              smallFontSpacing: _smallFontSpacing,
              fontColor: _fontColor,
              day: "Friday"),
          RecordItem(
              smallFontSpacing: _smallFontSpacing,
              fontColor: _fontColor,
              day: "Saturday"),
        ],
      ),
    );
  }
}

class GraphPainter extends CustomPainter {
  Paint trackBarPaint = Paint()
    ..color = Color(0xff818aab)
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 12;

  Paint trackPaint = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 12;

  @override
  void paint(Canvas canvas, Size size) {
    Path trackPath = Path();
    Path trackBarPath = Path();

    List val = [
      size.height * 0.8,
      size.height * 0.3,
      size.height * 0.6,
      size.height * 0.2,
      size.height * 0.7,
    ];

    double origin = 8;

    for (int i = 0; i < val.length; i++) {
      trackPath.moveTo(origin, size.height);
      trackPath.lineTo(origin, 0);

      trackBarPath.moveTo(origin, size.height);
      trackBarPath.lineTo(origin, val[i]);

      origin = origin + size.width * 0.22;
    }

    canvas.drawPath(trackPath, trackPaint);
    canvas.drawPath(trackBarPath, trackBarPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}

class RecordItem extends StatelessWidget {
  const RecordItem({
    Key key,
    @required double smallFontSpacing,
    @required Color fontColor,
    @required String day,
  })  : _smallFontSpacing = smallFontSpacing,
        _fontColor = fontColor,
        this.day = day,
        super(key: key);

  final double _smallFontSpacing;
  final Color _fontColor;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(
            color: Color(0xffdde9f7),
            width: 1.5,
          ),
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              day,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  "25/06/2021",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    letterSpacing: _smallFontSpacing,
                    color: _fontColor,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: Text(
                    "45.3 Minutes",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        letterSpacing: _smallFontSpacing,
                        color: _fontColor),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}

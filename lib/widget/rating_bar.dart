import 'package:flutter/widgets.dart';
import 'dart:math' as Math;

const double kMaxRate = 5.0;
const int kNumberOfStarts = 5;
const double kSpacing = 3.0;
const double kSize = 50.0;

/// 静态控件
class StaticRatingBar extends StatelessWidget {
  /// 星星数量
  final int count;

  /// 分数
  final double rate;

  /// 星星大小
  final double size;

  final double radiusRatio;

  final Color colorLight;

  final Color colorDark;

  StaticRatingBar({
    double rate,
    Color colorLight,
    Color colorDark,
    int count,
    this.size: kSize,
    this.radiusRatio: 1.1,
  })  : rate = rate ?? kMaxRate,
        count = count ?? kNumberOfStarts,
        colorDark = colorDark ?? new Color(0xffeeeeee),
        colorLight = colorLight ?? new Color(0xffFF962E);

  Widget buildStar() {
    return new SizedBox(
        width: size * count,
        height: size,
        child: new CustomPaint(
          painter: new _PainterStars(
              size: this.size / 2,
              color: colorLight,
              radiusRatio: radiusRatio,
              style: PaintingStyle.fill,
              strokeWidth: 0.0),
        ));
  }

  Widget buildHollowStar() {
    return new SizedBox(
        width: size * count,
        height: size,
        child: new CustomPaint(
          painter: new _PainterStars(
              size: this.size / 2,
              color: colorDark,
              radiusRatio: radiusRatio,
              style: PaintingStyle.fill,
              strokeWidth: 0.0),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        buildHollowStar(),
        new ClipRect(
          clipper: new _RatingBarClipper(width: rate * size),
          child: buildStar(),
        )
      ],
    );
  }
}

class _RatingBarClipper extends CustomClipper<Rect> {
  final double width;

  _RatingBarClipper({this.width}) : assert(width != null);

  @override
  Rect getClip(Size size) {
    return new Rect.fromLTRB(0.0, 0.0, width, size.height);
  }

  @override
  bool shouldReclip(_RatingBarClipper oldClipper) {
    return width != oldClipper.width;
  }
}

/// 角度转弧度公式
double degree2Radian(int degree) {
  return (Math.pi * degree / 180);
}

Path createStarPath(double radius, double radiusRatio, Path path) {
  // radius 半径 决定大小

  // 36为五角星的角度
  double radian = degree2Radian(36);

  // 正五角星情况下 中间五边形的半径
  double radiusInDef = radius * Math.sin(radian / 2) / Math.cos(radian);

  // 实际中间五边形的半径,太正不是很好看，扩大一点点
  double radiusIn = radiusInDef * radiusRatio;
//  debugPrint('radius_in $radius_in');

  // 计算外部五边形5个顶点坐标
  _Point _pointA = _Point((radius * Math.cos(radian / 2)), 0.0);
  _Point _pointB = _Point((radius * Math.cos(radian / 2) * 2),
      (radius - radius * Math.sin(radian / 2)));
  _Point _pointC = _Point(
      (radius * Math.cos(radian / 2) + radius * Math.sin(radian)),
      (radius + radius * Math.cos(radian)));
  _Point _pointD = _Point(
      (radius * Math.cos(radian / 2) - radius * Math.sin(radian)),
      (radius + radius * Math.cos(radian)));
  _Point _pointE = _Point(0.0, (radius - radius * Math.sin(radian / 2)));

  // 中心坐标
  _Point _pointO = _Point((radius * Math.cos(radian / 2)), radius);
//  _Point _pointO = _Point(0.0, 0.0);
//  debugPrint(_pointO.toString());

//  radius_in = 10.0;
  // 计算内部五边形5个顶点坐标
  _Point _pointAi = _Point(_pointO.px + radiusIn * Math.sin(radian),
      _pointO.py - radiusIn * Math.cos(radian));
  _Point _pointBi = _Point(_pointO.px + radiusIn * Math.cos(radian / 2),
      _pointO.py + radiusIn * Math.sin(radian / 2));
  _Point _pointCi = _Point(_pointO.px, _pointO.py + radiusIn);
  _Point _pointDi = _Point(_pointO.px - radiusIn * Math.cos(radian / 2),
      _pointO.py + radiusIn * Math.sin(radian / 2));
  _Point _pointEi = _Point(_pointO.px - radiusIn * Math.sin(radian),
      _pointO.py - radiusIn * Math.cos(radian));

  // 绘制
  path.moveTo(_pointA.px, _pointA.py);
  path.lineTo(_pointAi.px, _pointAi.py);
  path.lineTo(_pointB.px, _pointB.py);
  path.lineTo(_pointBi.px, _pointBi.py);
  path.lineTo(_pointC.px, _pointC.py);
  path.lineTo(_pointCi.px, _pointCi.py);
  path.lineTo(_pointD.px, _pointD.py);
  path.lineTo(_pointDi.px, _pointDi.py);
  path.lineTo(_pointE.px, _pointE.py);
  path.lineTo(_pointEi.px, _pointEi.py);
  path.lineTo(_pointA.px, _pointA.py);

  return path;
}

// 坐标点类
class _Point {
  final double px;
  final double py;

  _Point(this.px, this.py);

  @override
  String toString() {
    return '_Point{px: $px, py: $py}';
  }
}

class _PainterStars extends CustomPainter {
  final double size;
  final Color color;
  final PaintingStyle style;
  final double strokeWidth;
  final double radiusRatio;

  _PainterStars(
      {this.size, this.color, this.strokeWidth, this.style, this.radiusRatio});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint();
    //   paint.color = Colors.redAccent;
    paint.strokeWidth = strokeWidth;
    paint.color = color;
    paint.style = style;

    Path path = new Path();

    double offset = strokeWidth > 0 ? strokeWidth + 2 : 0.0;

    path = createStarPath(this.size - offset, radiusRatio ?? 1.0, path);
    path = path.shift(new Offset(this.size * 2, 0.0));
    path = createStarPath(this.size - offset, radiusRatio ?? 1.0, path);
    path = path.shift(new Offset(this.size * 2, 0.0));
    path = createStarPath(this.size - offset, radiusRatio ?? 1.0, path);
    path = path.shift(new Offset(this.size * 2, 0.0));
    path = createStarPath(this.size - offset, radiusRatio ?? 1.0, path);
    path = path.shift(new Offset(this.size * 2, 0.0));
    path = createStarPath(this.size - offset, radiusRatio ?? 1.0, path);

    if (offset > 0) {
      path = path.shift(new Offset(offset, offset));
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_PainterStars oldDelegate) {
    return oldDelegate.size != this.size;
  }
}

class RatingBar extends StatefulWidget {
  /// 回调
  final ValueChanged<int> onChange;

  /// 大小， 默认 50
  final double size;

  /// 值 1-5
  final int value;

  /// 数量 5 个默认
  final int count;

  /// 高亮
  final Color colorLight;

  /// 底色
  final Color colorDark;

  /// 如果有值，那么就是空心的
  final double strokeWidth;

  /// 越大，五角星越圆
  final double radiusRatio;

  RatingBar(
      {this.onChange,
      this.value,
      this.size: kSize,
      this.count: kNumberOfStarts,
      this.strokeWidth,
      this.radiusRatio: 1.1,
      Color colorDark,
      Color colorLight})
      : colorDark = colorDark ?? new Color(0xffDADBDF),
        colorLight = colorLight ?? new Color(0xffFF962E);

  @override
  State<StatefulWidget> createState() {
    return new _RatingBarState();
  }
}

class _PainterStar extends CustomPainter {
  final double size;
  final Color color;
  final PaintingStyle style;
  final double strokeWidth;
  final double radiusRatio;

  _PainterStar(
      {this.size, this.color, this.strokeWidth, this.style, this.radiusRatio});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint();
    paint.strokeWidth = strokeWidth;
    paint.color = color;
    paint.style = style;
    Path path = new Path();
    double offset = strokeWidth > 0 ? strokeWidth + 2 : 0.0;

    path = createStarPath(this.size - offset, radiusRatio, path);

    if (offset > 0) {
      path = path.shift(new Offset(offset, offset));
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_PainterStar oldDelegate) {
    return oldDelegate.size != this.size ||
        oldDelegate.color != this.color ||
        oldDelegate.strokeWidth != this.strokeWidth;
  }
}

class _RatingBarState extends State<RatingBar> {
  int _value;

  @override
  void initState() {
    _value = widget.value;
    super.initState();
  }

  Widget buildItem(int index, double size, count) {
    bool selected = _value != null && _value > index;

    bool stroke = widget.strokeWidth != null && widget.strokeWidth > 0;

    return new GestureDetector(
      onTap: () {
        if (widget.onChange != null) {
          widget.onChange(index + 1);
        }

        setState(() {
          _value = index + 1;
        });
      },
      behavior: HitTestBehavior.opaque,
      child: new SizedBox(
          width: size,
          height: size,
          child: new CustomPaint(
            painter: new _PainterStar(
                radiusRatio: widget.radiusRatio,
                size: size / 2,
                color: selected ? widget.colorLight : widget.colorDark,
                style: !selected && stroke
                    ? PaintingStyle.stroke
                    : PaintingStyle.fill,
                strokeWidth: !selected && stroke ? widget.strokeWidth : 0.0),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    double size = widget.size;
    int count = widget.count;

    List<Widget> list = [];
    for (int i = 0; i < count; ++i) {
      list.add(buildItem(i, size, count));
    }

    return new Row(
      children: list,
    );
  }
}
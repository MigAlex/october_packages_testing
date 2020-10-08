import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class HomeSkeleton extends StatefulWidget {
  @override
  _HomeSkeletonState createState() => _HomeSkeletonState();
}

class _HomeSkeletonState extends State<HomeSkeleton> {
  bool loading = true;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future loadData() async {
    setState(() {
      loading = true;
    });

    await Future.delayed(Duration(seconds: 4), () {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(icon: Icon(Icons.refresh), onPressed: loadData)],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) =>
            loading ? buildSkeleton(context, index) : buildResult(),
        separatorBuilder: (context, index) => Divider(),
        itemCount: 10,
      ),
    );
  }

  Widget buildSkeleton(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        SkeletonContainer.square(
          width: 70,
          height: 70,
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SkeletonContainer.rounded(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 15,
            ),
            const SizedBox(height: 8),
            SkeletonContainer.rounded(
              width: 60,
              height: 13,
            ),
          ],
        ),
      ],
    );
  }

  Widget buildResult() => Row(
        children: <Widget>[
          Container(
            child: Image.network(
              'https://images.unsplash.com/photo-1508697014387-db70aad34f4d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80',
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Hello', style: TextStyle(fontSize: 15)),
              const SizedBox(height: 8),
              Text('Hello', style: TextStyle(fontSize: 13)),
            ],
          ),
        ],
      );
}

class SkeletonContainer extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius borderRadius;

  const SkeletonContainer._({
    this.width = double.infinity,
    this.height = double.infinity,
    this.borderRadius = const BorderRadius.all(Radius.circular(0)),
    Key key,
  }) : super(key: key);

  const SkeletonContainer.square({
    double width,
    double height,
  }) : this._(width: width, height: height);

  const SkeletonContainer.rounded({
    double width,
    double height,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(12)),
  }) : this._(width: width, height: height, borderRadius: borderRadius);

  const SkeletonContainer.circular({
    double width,
    double height,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(80)),
  }) : this._(width: width, height: height, borderRadius: borderRadius);

  @override
  Widget build(BuildContext context) => SkeletonAnimation(
        //gradientColor: Colors.orange,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: borderRadius),
        ),
      );
}

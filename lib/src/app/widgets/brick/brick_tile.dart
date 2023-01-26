import 'package:flutter/material.dart';

class BrickTile extends StatefulWidget {
  final EdgeInsetsGeometry padding;

  final bool isChecked;

  final Function(bool?)? checkOnChnaged;

  final String title;

  final Function()? onDelete;

  final Function()? swipeOnLeftToRight;

  final Function()? swipeOnRightToLeft;

  const BrickTile({
    super.key,
    this.padding = const EdgeInsets.all(5),
    this.isChecked = false,
    this.checkOnChnaged,
    required this.title,
    this.onDelete,
    this.swipeOnRightToLeft,
    this.swipeOnLeftToRight,
  });

  @override
  State<BrickTile> createState() => _BrickTileState();
}

class _BrickTileState extends State<BrickTile> {
  bool checkVal = false;

  @override
  void setState(VoidCallback fn) {
    checkVal = widget.isChecked;
    super.setState(fn);
  }

  void changeCheckVal(bool val) {
    setState(() {
      checkVal = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((BuildContext ctx, BoxConstraints constraints) {
        // TODO: Swipe Action 처리
        return Container(
          height: 70,
          width: constraints.maxWidth,
          padding: widget.padding,
          margin: widget.padding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Transform.scale(
                  scale: 1.3,
                  child: Checkbox(
                    value: checkVal,
                    shape: const CircleBorder(),
                    onChanged: (val) {
                      if (val != null) {
                        changeCheckVal(val);

                        if (widget.checkOnChnaged != null) {
                          widget.checkOnChnaged!(val);
                        }
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              widget.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: null,
                              style: TextStyle(
                                fontSize: 18,
                                decoration: checkVal
                                    ? TextDecoration.lineThrough
                                    : null,
                                color: checkVal ? Colors.grey : null,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 10,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 24,
                height: 24,
                child: IconButton(
                  onPressed: widget.onDelete,
                  icon: const Icon(
                    Icons.delete,
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_dictionary/data/data_model.dart';

class HomeItem extends StatefulWidget {
  final DataModel? model;

  const HomeItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<HomeItem> createState() => _HomeItemState();
}

class _HomeItemState extends State<HomeItem> {
  int _maxLine = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Color(0xffE3F2FD),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.model?.title ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(0xff020D19),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  widget.model?.body ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xff020D19),
                    fontSize: 16,
                  ),
                  maxLines: _maxLine,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _maxLine = _maxLine == 3 ? 1000 : 3;
                  });
                },
                icon: RotatedBox(
                  quarterTurns: _maxLine == 3 ? 3 : 1,
                  child: const Icon(
                    Icons.chevron_left_rounded,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
          if (_maxLine > 3 && widget.model?.image != null)
            Visibility(
              visible: widget.model?.image != null,
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Image.asset(
                  "assets/png/${widget.model?.image ?? ''}",
                  width: Get.width,
                  fit: BoxFit.fitWidth,
                ),
              ),
            )
        ],
      ),
    );
  }
}

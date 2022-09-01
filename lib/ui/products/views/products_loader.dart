import 'package:flutter/material.dart';

import '../../../components/shimmer_widget.dart';

class ProductLoader extends StatelessWidget {
  const ProductLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 4,
      padding: const EdgeInsets.all(10),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsetsDirectional.only(bottom: 20),
          child: Row(
            children: [
              const ShimmerWidget(
                height: 160,
                width: 100,
                radius: 16,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 6),
                    ShimmerWidget(height: 20, width: 100,),
                    SizedBox(height: 6),
                    ShimmerWidget(height: 14, width: 70),
                    SizedBox(height: 1),
                    ShimmerWidget(height: 14, width: 90),
                    SizedBox(height: 6),
                    ShimmerWidget(height: 20, width: 130),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Padding(
        padding: EdgeInsetsDirectional.only(bottom: 20),
        child: ShimmerWidget(height: 1),
      ),
    );
  }
}

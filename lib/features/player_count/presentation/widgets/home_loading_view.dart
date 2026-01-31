import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/shimmer_loading.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/user_clock.dart';
import 'package:flutter/material.dart';

class HomeLoadingView extends StatelessWidget {
  const HomeLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 32.0),
          child: UserClock(),
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 4,
                    child: ShimmerLoading(width: double.infinity, height: 300, borderRadius: 24),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    flex: 6,
                    child: ShimmerLoading(width: double.infinity, height: 400, borderRadius: 24),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  const ShimmerLoading(width: double.infinity, height: 300, borderRadius: 24),
                  const SizedBox(height: 24),
                  const ShimmerLoading(width: double.infinity, height: 400, borderRadius: 24),
                ],
              );
            }
          },
        ),
        const SizedBox(height: 24),
        const ShimmerLoading(width: double.infinity, height: 200, borderRadius: 24),
      ],
    );
  }
}

import 'package:arc_raiders_tracker/core/entities/game.dart';
import 'package:arc_raiders_tracker/core/theme/app_theme.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/news_item.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/bloc/game_selector_cubit.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/bloc/news/news_cubit.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/bloc/news/news_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsSection extends StatelessWidget {
  const NewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = context.read<NewsCubit>();
        final appId = context.read<GameSelectorCubit>().state.appId;
        cubit.loadNews(appId);
        return cubit;
      },
      child: BlocListener<GameSelectorCubit, Game>(
        listener: (context, state) {
          context.read<NewsCubit>().loadNews(state.appId);
        },
        child: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (news) => _buildNewsList(context, news),
              loading: () => const Center(child: CircularProgressIndicator()),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildNewsList(BuildContext context, List<NewsItem> news) {
    if (news.isEmpty) return const SizedBox.shrink();

    final colors = ThemeColors.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
          child: Text(
            'LATEST NEWS',
            style: GoogleFonts.barlow(
              color: colors.textSecondary,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              fontSize: 12,
            ),
          ),
        ),
        SizedBox(
          height: 140, // Fixed height for horizontal scroll
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: news.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              return _NewsCard(item: news[index]);
            },
          ),
        ),
      ],
    );
  }
}

class _NewsCard extends StatelessWidget {
  const _NewsCard({required this.item});

  final NewsItem item;

  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);
    final dateStr = DateFormat('MMM d, yyyy').format(item.date);

    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colors.textTertiary.withOpacity(0.1)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () async {
            final uri = Uri.parse(item.url);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: colors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        item.feedLabel.toUpperCase(),
                        style: GoogleFonts.barlow(
                          color: colors.primary,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      dateStr,
                      style: GoogleFonts.barlow(
                        color: colors.textTertiary,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  item.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.barlow(
                    color: colors.textPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'Read More',
                      style: GoogleFonts.barlow(
                        color: colors.textSecondary,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(Icons.arrow_forward, size: 10, color: colors.textSecondary),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

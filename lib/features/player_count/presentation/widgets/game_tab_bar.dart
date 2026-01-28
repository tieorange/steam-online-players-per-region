import 'package:arc_raiders_tracker/core/constants/game_registry.dart';
import 'package:arc_raiders_tracker/core/entities/game.dart';
import 'package:arc_raiders_tracker/core/theme/app_theme.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/bloc/game_selector_cubit.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/bloc/player_count_bloc.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/bloc/player_count_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

/// Tab bar widget for selecting between different games
class GameTabBar extends StatelessWidget {
  const GameTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameSelectorCubit, Game>(
      builder: (context, selectedGame) {
        final colors = ThemeColors.of(context);
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: colors.surfaceHighlight),
          ),
          child: Row(
            children: GameRegistry.all.asMap().entries.map((entry) {
              final index = entry.key;
              final game = entry.value;
              final isSelected = game == selectedGame;

              return Expanded(
                child: _GameTab(
                  game: game,
                  isSelected: isSelected,
                  onTap: () => _onGameSelected(context, game),
                  isFirst: index == 0,
                  isLast: index == GameRegistry.all.length - 1,
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  void _onGameSelected(BuildContext context, Game game) {
    // Update game selector cubit
    context.read<GameSelectorCubit>().selectGame(game);
    // Trigger player count refresh for new game
    context.read<PlayerCountBloc>().add(PlayerCountEvent.gameChanged(appId: game.appId));
  }
}

class _GameTab extends StatelessWidget {
  const _GameTab({
    required this.game,
    required this.isSelected,
    required this.onTap,
    required this.isFirst,
    required this.isLast,
  });

  final Game game;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: AppAnimations.fast,
        curve: AppAnimations.curve,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? colors.primary.withValues(alpha: 0.15) : Colors.transparent,
          borderRadius: BorderRadius.horizontal(
            left: isFirst ? const Radius.circular(11) : Radius.zero,
            right: isLast ? const Radius.circular(11) : Radius.zero,
          ),
          border: isSelected ? Border.all(color: colors.primary.withValues(alpha: 0.3)) : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _getGameIcon(game),
              color: isSelected ? colors.primary : colors.textSecondary,
              size: 18,
            ),
            const SizedBox(width: 8),
            Text(
              game.shortName,
              style: GoogleFonts.orbitron(
                color: isSelected ? colors.primary : colors.textSecondary,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 14,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getGameIcon(Game game) {
    // Simple icon mapping based on game name
    if (game.name.contains('Battlefield')) {
      return Icons.military_tech;
    } else if (game.name.contains('Arc')) {
      return Icons.rocket_launch;
    }
    return Icons.sports_esports;
  }
}

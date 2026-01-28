import 'package:arc_raiders_tracker/core/entities/game.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ShareableStatCard extends StatelessWidget {
  const ShareableStatCard({
    super.key,
    required this.game,
    required this.playerCount,
    required this.peakTime,
  });

  final Game game;
  final int playerCount;
  final String peakTime;

  @override
  Widget build(BuildContext context) {
    // Hardcoded dark theme for consistent image output regardless of user theme
    const bg = Color(0xFF0A0F14);
    const primary = Color(0xFFFF5722); // Arc Raiders Orange-ish
    const textMain = Colors.white;
    const textSub = Colors.white70;

    return Container(
      width: 400,
      height: 400,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white10),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            bg,
            Color(0xFF1A1F24),
          ],
        ),
      ),
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.gamepad, color: primary, size: 28),
              const SizedBox(width: 12),
              Text(
                game.shortName.toUpperCase(),
                style: GoogleFonts.orbitron(
                  color: textMain,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            'LIVE PLAYERS',
            style: GoogleFonts.barlow(
              color: textSub,
              fontSize: 16,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            NumberFormat('#,###').format(playerCount),
            style: GoogleFonts.orbitron(
              color: textMain,
              fontSize: 64,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'ONLINE NOW',
            style: GoogleFonts.barlow(
              color: primary,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Icon(Icons.access_time, color: textSub, size: 20),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PREDICTED PEAK',
                      style: GoogleFonts.barlow(
                        color: textSub,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      peakTime,
                      style: GoogleFonts.orbitron(
                        color: textMain,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'steam-regions.vercel.app',
              style: GoogleFonts.barlow(
                color: textSub.withOpacity(0.5),
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Controls extends StatelessWidget {
  final AudioPlayer player;
  const Controls({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: player.seekToPrevious,
          iconSize: 70,
          color: const Color(0xff52D3D8),
          icon: const Icon(Icons.skip_previous_rounded),
        ),
        StreamBuilder<PlayerState>(
            stream: player.playerStateStream,
            builder: (context, snapshot) {
              final playerSate = snapshot.data;
              final processingState = playerSate?.processingState;
              final playing = playerSate?.playing;

              if (!(playing ?? false)) {
                return IconButton(
                  onPressed: player.play,
                  iconSize: 80,
                  color: const Color(0xff52D3D8),
                  icon: const Icon(Icons.play_arrow_rounded),
                );
              } else if (processingState != ProcessingState.completed) {
                return IconButton(
                  onPressed: player.pause,
                  iconSize: 80,
                  color: const Color(0xff52D3D8),
                  icon: const Icon(Icons.pause_rounded),
                );
              }

              return IconButton(
                onPressed: () {},
                iconSize: 80,
                color: const Color(0xff52D3D8),
                icon: const Icon(Icons.house_siding_outlined),
              );
            }),
        IconButton(
          onPressed: player.seekToNext,
          iconSize: 70,
          color: const Color(0xff52D3D8),
          icon: const Icon(Icons.skip_next_rounded),
        ),
      ],
    );
  }
}

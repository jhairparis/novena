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
          icon: const Icon(Icons.skip_previous_rounded),
          tooltip: "Anterior villancico",
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
                  icon: const Icon(Icons.play_arrow_rounded),
                  tooltip: "Iniciar villancico",
                );
              } else if (processingState != ProcessingState.completed) {
                return IconButton(
                  onPressed: player.pause,
                  iconSize: 80,
                  icon: const Icon(Icons.pause_rounded),
                  tooltip: "Pausar villancico",
                );
              }

              return IconButton(
                onPressed: () {},
                iconSize: 80,
                icon: const Icon(Icons.house_siding_outlined),
                tooltip: "Fin de la lista de villancicos",
              );
            }),
        IconButton(
          onPressed: player.seekToNext,
          iconSize: 70,
          icon: const Icon(Icons.skip_next_rounded),
          tooltip: "Siguiente villancico",
        ),
      ],
    );
  }
}

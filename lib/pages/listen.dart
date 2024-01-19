import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:novena/components/player/player_widget.dart';
import 'package:novena/models/christmas_carol_model.dart';

class ListenPage extends StatelessWidget {
  final ChristmasCarolModel info;
  final ConcatenatingAudioSource playlist;
  const ListenPage({super.key, required this.info, required this.playlist});

  @override
  Widget build(BuildContext context) {
    return PlayerWidget(song: info.id, playlist: playlist);
  }
}

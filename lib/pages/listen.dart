import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:novena/models/christmas_carol_model.dart';
import 'package:novena/styles/styles.dart';
import 'package:rxdart/rxdart.dart';

Styles styles = Styles();

class PositionData {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;

  PositionData({
    required this.position,
    required this.bufferedPosition,
    required this.duration,
  });
}

class PlayerWidget extends StatefulWidget {
  final String song;
  const PlayerWidget({super.key, required this.song});

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  late AudioPlayer _player;
  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _player.positionStream,
        _player.bufferedPositionStream,
        _player.durationStream,
        (position, bufferedPosition, duration) => PositionData(
            position: position,
            bufferedPosition: bufferedPosition,
            duration: duration ?? Duration.zero),
      );

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer()..setAsset(widget.song);
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      StreamBuilder<PositionData>(
          stream: _positionDataStream,
          builder: (context, snapshot) {
            final positionData = snapshot.data;
            return ProgressBar(
              progress: positionData?.position ?? Duration.zero,
              buffered: positionData?.bufferedPosition ?? Duration.zero,
              total: positionData?.duration ?? Duration.zero,
              onSeek: _player.seek,
              barHeight: 8,
              baseBarColor: Colors.amber,
              bufferedBarColor: Colors.amberAccent,
              progressBarColor: Colors.white,
              thumbColor: Colors.red,
              timeLabelTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            );
          }),
      Controls(player: _player),
    ]);
  }
}

class Controls extends StatelessWidget {
  final AudioPlayer player;
  const Controls({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
        stream: player.playerStateStream,
        builder: (context, snapshot) {
          final playerSate = snapshot.data;
          final processinState = playerSate?.processingState;
          final playing = playerSate?.playing;

          if (!(playing ?? false)) {
            return IconButton(
              onPressed: player.play,
              iconSize: 80,
              color: Colors.white,
              icon: const Icon(Icons.play_arrow),
            );
          } else if (processinState != ProcessingState.completed) {
            return IconButton(
              onPressed: player.pause,
              iconSize: 80,
              color: Colors.white,
              icon: const Icon(Icons.pause),
            );
          }

          return IconButton(
            onPressed: () {},
            iconSize: 80,
            color: Colors.white,
            icon: const Icon(Icons.house_siding_outlined),
          );
        });
  }
}

class ListenPage extends StatelessWidget {
  final ChristmasCarol info;
  const ListenPage({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xff5D3587),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      info.image,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      info.name,
                      style: styles.heading5.copyWith(
                        color: const Color(0xffFFD1E3),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    PlayerWidget(song: info.audio),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  iconSize: 80,
                  color: Colors.white,
                  icon: const Icon(Icons.exit_to_app),
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

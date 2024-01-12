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
    _player = AudioPlayer();
    if (widget.song != "") {
      _player.setAsset(widget.song);
    }
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
              baseBarColor: const Color(0xff176B87),
              bufferedBarColor: const Color(0x5AEEF5FF),
              progressBarColor: const Color(0xff86B6F6),
              thumbColor: const Color(0xffB4D4FF),
              timeLabelTextStyle: const TextStyle(
                color: Color(0xff52D3D8),
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
  const Controls({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
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
              icon: const Icon(Icons.play_arrow),
            );
          } else if (processingState != ProcessingState.completed) {
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
  const ListenPage({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff11235A),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff52D3D8),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: Color(0xff52D3D8),
            ),
          ),
        ],
        title: Text(
          info.name,
          style: styles.heading5.copyWith(
            color: const Color(0xff52D3D8),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xff11235A),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                info.image,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 32,
              ),
              Expanded(
                  child: FutureBuilder(
                      future: styles.loadText(context, info.lyrics),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          // print("Error: ${snapshot.error}");
                          return Text(
                            "Ops! Algo salió mal.",
                            style: styles.heading6.copyWith(
                              color: const Color(0xffFFD1E3),
                            ),
                          );
                        } else {
                          return ListView(
                            children: [
                              Text(
                                snapshot.data ?? "default value",
                                style: styles.heading6.copyWith(
                                  color: const Color(0xffFFD1E3),
                                ),
                              )
                            ],
                          );
                        }
                      })),
              const SizedBox(
                height: 32,
              ),
              PlayerWidget(song: info.audio),
            ],
          ),
        ),
      ),
    );
  }
}

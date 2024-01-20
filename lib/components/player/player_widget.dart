import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:novena/components/player/controls.dart';
import 'package:novena/models/christmas_carol_model.dart';
import 'package:rxdart/rxdart.dart';

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
  final int song;
  final ConcatenatingAudioSource playlist;
  const PlayerWidget({super.key, required this.song, required this.playlist});

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
    _init();
  }

  Future<void> _init() async {
    try {
      await _player.setLoopMode(LoopMode.all);
      await _player.setAudioSource(widget.playlist);
      await _player.seek(Duration.zero, index: widget.song);
    } catch (e) {
      // ignore this errors
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<String> loadText(BuildContext context, String source) async {
    return await DefaultAssetBundle.of(context)
        .loadString('assets/txt/$source.txt');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: StreamBuilder<SequenceState?>(
              stream: _player.sequenceStateStream,
              builder: (ctx, snapshot) {
                final state = snapshot.data;
                if (state?.sequence.isEmpty ?? true) {
                  return const SizedBox();
                }
                final metaData =
                    state!.currentSource!.tag as ChristmasCarolModel;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      metaData.image,
                      height: 300,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: FutureBuilder(
                          future: loadText(context, metaData.lyrics),
                          builder: (cxt, snap) {
                            if (snap.connectionState ==
                                ConnectionState.waiting) {
                              return const Padding(
                                padding: EdgeInsets.only(
                                  right: 150,
                                  left: 150,
                                  top: 130,
                                  bottom: 130,
                                ),
                                child:
                                    CircularProgressIndicator(strokeWidth: 10),
                              );
                            } else if (snap.hasError) {
                              return Text(
                                "Ops! Algo salió mal.",
                                style: Theme.of(context).textTheme.bodyLarge,
                              );
                            } else {
                              return SingleChildScrollView(
                                child: Text(
                                  snap.data ?? "default value",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    _progressBar(),
                    Controls(player: _player),
                  ],
                );
              }),
        ),
      ),
    );
  }

  StreamBuilder<PositionData> _progressBar() {
    return StreamBuilder<PositionData>(
        stream: _positionDataStream,
        builder: (context, snapshot) {
          final positionData = snapshot.data;
          return ProgressBar(
            progress: positionData?.position ?? Duration.zero,
            buffered: positionData?.bufferedPosition ?? Duration.zero,
            total: positionData?.duration ?? Duration.zero,
            onSeek: _player.seek,
            barHeight: 8,
          );
        });
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back),
        tooltip: "Regresar",
      ),
      /* actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share,
            color: Color(0xff52D3D8),
          ),
        ),
      ], */
      title: StreamBuilder<SequenceState?>(
          stream: _player.sequenceStateStream,
          builder: (context, snapshot) {
            final state = snapshot.data;
            if (state?.sequence.isEmpty ?? true) {
              return Text(
                'None selected',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }
            final metadata = state!.currentSource!.tag as ChristmasCarolModel;
            return Text(
              metadata.name,
              style: Theme.of(context).textTheme.headlineMedium,
            );
          }),
    );
  }
}

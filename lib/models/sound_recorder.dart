import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

class SoundRecorder {
  final String path = 'audio_sample.aac';
  FlutterSoundRecorder? recorder;
  bool isRecorderInitialized = false;
  Future init() async {
    recorder = FlutterSoundRecorder();
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException('Microphone permission denied');
    }
    await recorder!.openAudioSession();
    isRecorderInitialized = true;
  }

  Future _record() async {
    if (!isRecorderInitialized) return;
    await recorder!.startRecorder(toFile: path);
  }

  Future _stop() async {
    if (!isRecorderInitialized) return;
    await recorder!.stopRecorder();
  }

  Future toggleRecording() async {
    if (!isRecorderInitialized) return;
    if (recorder!.isStopped) {
      await _record();
    } else {
      await _stop();
    }
  }

  void dispose() {
    if (!isRecorderInitialized) return;
    recorder!.closeAudioSession();
    recorder = null;
    isRecorderInitialized = false;
  }
}

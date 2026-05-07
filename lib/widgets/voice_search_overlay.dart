import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../utils/theme.dart';

class VoiceSearchOverlay extends StatefulWidget {
  final Function(String) onSearch;
  final VoidCallback onDismiss;

  const VoiceSearchOverlay({
    super.key,
    required this.onSearch,
    required this.onDismiss,
  });

  @override
  State<VoiceSearchOverlay> createState() => _VoiceSearchOverlayState();
}

class _VoiceSearchOverlayState extends State<VoiceSearchOverlay>
    with TickerProviderStateMixin {
  late stt.SpeechToText _speech;
  bool _speechEnabled = false;
  bool _isListening = false;
  String _transcribedText = '';
  late final AnimationController _pulseController;
  late final AnimationController _slideController;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _pulseController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _initSpeech();
    _slideController.forward();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _slideController.dispose();
    _speech.stop();
    super.dispose();
  }

  Future<void> _initSpeech() async {
    _speechEnabled = await _speech.initialize();
    setState(() {});
  }

  Future<void> _requestPermission() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Microphone permission required')),
        );
      }
    }
  }

  Future<void> _startListening() async {
    await _requestPermission();
    if (!_speechEnabled || !mounted) return;

    await _speech.listen(
      onResult: _onSpeechResult,
      localeId: 'en_IN', // Indian English for better mobile number recognition
      pauseFor: const Duration(seconds: 3),
    );
    setState(() => _isListening = true);
  }

  Future<void> _stopListening() async {
    await _speech.stop();
    setState(() => _isListening = false);

    // Extract 10-digit mobile from text
    final mobile = _extractMobileNumber(_transcribedText);
    if (mobile.isNotEmpty) {
      widget.onSearch(mobile);
      Future.delayed(const Duration(milliseconds: 500), widget.onDismiss);
    }
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _transcribedText = result.recognizedWords;
    });
  }

  String _extractMobileNumber(String text) {
    final regExp = RegExp(r'(\d{10})');
    final match = regExp.firstMatch(text.replaceAll(RegExp(r'[^\d]'), ''));
    return match?.group(1) ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.black.withValues(alpha: 0.5),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: widget.onDismiss,
              child: Container(
                width: double.infinity,
                height: 4,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(24),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    theme.colorScheme.surface.withValues(alpha: 0.9),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 30,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 0.3),
                      end: Offset.zero,
                    ).animate(_slideController),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            AnimatedBuilder(
                              animation: _pulseController,
                              builder: (context, child) {
                                return Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: RadialGradient(
                                      colors: [
                                        AppTheme.primaryBlue.withValues(
                                          alpha: 0.3,
                                        ),
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    AppTheme.primaryBlue,
                                    AppTheme.primaryBlue.withValues(alpha: 0.8),
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppTheme.primaryBlue.withValues(
                                      alpha: 0.4,
                                    ),
                                    blurRadius: 20,
                                  ),
                                ],
                              ),
                              child: IconButton(
                                icon: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 200),
                                  child: Icon(
                                    _isListening ? Icons.mic : Icons.mic_none,
                                    key: ValueKey<bool>(_isListening),
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                ),
                                onPressed: _isListening
                                    ? _stopListening
                                    : _startListening,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Text(
                          _isListening
                              ? 'Listening...'
                              : 'Voice search by mobile',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surfaceContainer
                                .withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            _transcribedText.isEmpty
                                ? 'Say a mobile number...'
                                : _transcribedText,
                            style: theme.textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        if (_transcribedText.isNotEmpty) ...[
                          const SizedBox(height: 16),
                          ElevatedButton.icon(
                            onPressed: _stopListening,
                            icon: const Icon(Icons.search),
                            label: const Text('Search'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.primaryBlue,
                            ),
                          ),
                        ],
                        const SizedBox(height: 8),
                        TextButton(
                          onPressed: widget.onDismiss,
                          child: Text('Cancel'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

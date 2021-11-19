/* This is free and unencumbered software released into the public domain. */

import 'dart:convert' show htmlEscape;

import 'package:flutter/material.dart';
// import 'package:get/state_manager.dart';

//margin-top: 29%; margin-left: -10%; 

abstract class HTMLBuilder {
  HTMLBuilder._();

  static String build(
      {final String htmlTemplate = '',
      required final String src,
      final String? alt,
      final bool? ar,
      final List<String>? arModes,
      final String? arScale,
      final bool? autoRotate,
      final int? autoRotateDelay,
      final bool? autoPlay,
      final bool? cameraControls,
      final String? iosSrc,
      final String? animationName}) {
    final html = StringBuffer(htmlTemplate);
    html.write(
        '<script src="https://unpkg.com/focus-visible@5.1.0/dist/focus-visible.js"></script>');
    html.write(
        '<body><model-viewer');
    html.write(' disable-zoom src="${htmlEscape.convert(src)}"');
    html.write(
        ' style="background-color: transparent; outline: none; width: 100%; height: 100%; --poster-color: transparent; --progress-bar-height: 0px"');
    if (alt != null) {
      html.write(' alt="${htmlEscape.convert(alt)}"');
    }
    // TODO: animation-name
    // TODO: animation-crossfade-duration
    if (ar ?? false) {
      html.write(' ar');
    }
    if (arModes != null) {
      html.write(' ar-modes="${htmlEscape.convert(arModes.join(' '))}"');
    }
    if (arScale != null) {
      html.write(' ar-scale="${htmlEscape.convert(arScale)}"');
    }
    if (autoRotate ?? false) {
      html.write(' auto-rotate');
    }
    if (autoRotateDelay != null) {
      html.write(' auto-rotate-delay="$autoRotateDelay"');
    }
    if (autoPlay ?? false) {
      html.write(' autoplay');
    }
    // TODO: skybox-image
    if (cameraControls ?? false) {
      html.write(' camera-controls');
    }
    // TODO: camera-orbit
    // TODO: camera-target
    // TODO: environment-image
    // TODO: exposure
    // TODO: field-of-view
    // TODO: interaction-policy
    // TODO: interaction-prompt
    // TODO: interaction-prompt-style
    // TODO: interaction-prompt-threshold
    if (iosSrc != null) {
      html.write(' ios-src="${htmlEscape.convert(iosSrc)}"');
    }
    html.write(' min-camera-orbit="-infinity 80deg auto" max-camera-orbit="-infinity 80deg auto"');
    // TODO: max-field-of-view
    // TODO: min-camera-orbit
    // TODO: min-field-of-view
    // TODO: poster
    // TODO: loading
    // TODO: quick-look-browsers
    // TODO: reveal
    // TODO: shadow-intensity
    // TODO: shadow-softness
    html.writeln('></model-viewer></body>');
    return html.toString();
  }
}

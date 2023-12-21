import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:abs_customer_sites/application/admin_panel/web_desciption/web_description_bloc.dart';
import 'package:abs_customer_sites/core/init_dio.dart';

class MediaPreview extends StatelessWidget {
  final WebDescriptionBloc bloc;
  final MediaType mediaType;
  final String localMediaPath;
  final String networkMediaPath;

  const MediaPreview({
    @required this.bloc,
    @required this.mediaType,
    @required this.localMediaPath,
    @required this.networkMediaPath,
  });
  @override
  Widget build(BuildContext context) {
    // print('mediaType : $mediaType');
    // print('Local Media Type : $localMediaPath ');
    // print('Network Media Type : $networkMediaPath ');
    Widget widget;
    if (networkMediaPath == '') {
      if (localMediaPath != '') {
        widget = _MediaPreviewStack(
          mediaSource: MediaSource.local,
          mediaPath: localMediaPath,
          onPressed: () {
            if (mediaType == MediaType.video) {
              bloc.add(WebDescriptionRemoveVideoPressed());
            } else {
              bloc.add(WebDescriptionRemoveImagePressed());
            }
          },
        );
      } else {
        widget = Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          child: Icon(
            Icons.add_a_photo,
            size: 35,
          ),
        );
      }
    } else {
      if (localMediaPath != '') {
        widget = _MediaPreviewStack(
            mediaSource: MediaSource.local,
            mediaPath: localMediaPath,
            onPressed: () {
              if (mediaType == MediaType.video) {
                bloc.add(WebDescriptionRemoveVideoPressed());
              } else {
                bloc.add(WebDescriptionRemoveImagePressed());
              }
            });
      } else {
        widget = _MediaPreviewStack(
            mediaSource: MediaSource.network,
            mediaPath: networkMediaPath,
            onPressed: () {
              if (mediaType == MediaType.video) {
                bloc.add(WebDescriptionRemoveVideoPressed());
              } else {
                bloc.add(WebDescriptionRemoveImagePressed());
              }
            });
      }
    }
    return widget;
  }
}

class _MediaPreviewStack extends StatelessWidget {
  final MediaSource mediaSource;
  final String mediaPath;
  final VoidCallback onPressed;
  const _MediaPreviewStack({
    @required this.mediaSource,
    @required this.mediaPath,
    @required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 150,
          child: mediaSource == MediaSource.local
              ? Image.file(
                  File(mediaPath),
                  fit: BoxFit.cover,
                )
              : ExtendedImage.network(
                  CDNBaseUrl + mediaPath,
                  cache: true,
                  fit: BoxFit.cover,
                ),
        ),
        Positioned(
          top: -10,
          right: -10,
          child: InkWell(
            onTap: onPressed,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

enum MediaType { image, video }

enum MediaSource { local, network }

import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/application/core/utils/utils.dart';
import 'package:abs_customer_sites/domain/core/ticket/ticket.dart';
import 'package:abs_customer_sites/domain/core/ticket_reply/ticket_reply_repository.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:kt_dart/collection.dart';
import 'package:meta/meta.dart';

part 'ticket_reply_event.dart';
part 'ticket_reply_state.dart';

class TicketReplyBloc extends HydratedBloc<TicketReplyEvent, TicketReplyState> {
  final TicketReplyRepository ticketReplyRepository;
  final Ticket ticket;
  TicketReplyBloc({
    @required this.ticket,
    @required this.ticketReplyRepository,
  }) : super(TicketReplyEditing.intial(ticket.id));

  //the id field here is for caching multiple instances of
  //ticket reply bloc
  @override
  String get id => ticket.id;

  @override
  Stream<TicketReplyState> mapEventToState(
    TicketReplyEvent event,
  ) async* {
    if (event is TicketReplyTextChanged) {
      final currentState = state as TicketReplyEditing;
      yield currentState.copyWith(
        text: event.text,
      );
    } else if (event is TicketReplyAddFileButtonPressed) {
      final currentState = state as TicketReplyEditing;
      KtMutableList<PlatformFile> currentFiles =
          currentState.attachedFiles.toMutableList();
      try {
        FilePickerResult result =
            await FilePicker.platform.pickFiles(type: FileType.any);
        bool includesInavildFormat = _includesInavildFormat(result.files);
        if (includesInavildFormat) {
          yield currentState.copyWith(
            attachedFiles: currentFiles,
            attachedInvalidFile: includesInavildFormat,
          );
        } else {
          KtList<PlatformFile> attachedFiles = result.files.toImmutableList();
          currentFiles += attachedFiles;
          yield currentState.copyWith(
            attachedFiles: currentFiles,
            attachedInvalidFile: false,
          );
        }
      } catch (e) {
        print(e);
      }
    } else if (event is TicketReplyFileDeleted) {
      final currentState = state as TicketReplyEditing;
      KtMutableList<PlatformFile> currentFiles =
          currentState.attachedFiles.toMutableList();
      currentFiles.remove(event.platformFile);
      yield currentState.copyWith(
        attachedFiles: currentFiles,
        attachedInvalidFile: false,
      );
    } else if (event is TicketReplySendButtonPressed) {
      final currentState = state as TicketReplyEditing;
      List<File> files = currentState.attachedFiles
          .map((platfotmFile) => File(platfotmFile.path))
          .asList();
      try {
        await ticketReplyRepository.create(
          ticket.id,
          currentState.descriptionController.text,
          files,
        );
        Get.back();
      } catch (e) {
        Get.rawSnackbar(message: e.toString());
      }
    }
  }

  // cheching if any of the files has an unsportted format
  bool _includesInavildFormat(List<PlatformFile> files) {
    bool includeInavildFormat = false;
    files.forEach(
      (platformFile) {
        File file = File(platformFile.path);
        if (!availableFormats.contains(formatOf(file))) {
          includeInavildFormat = true;
        }
      },
    );
    return includeInavildFormat;
  }

  @override
  TicketReplyState fromJson(Map<String, dynamic> json) {
    try {
      final TicketReplyEditing ticketReplyEditing =
          TicketReplyEditing.fromMap(json);
      return ticketReplyEditing;
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(TicketReplyState state) {
    if (state is TicketReplyEditing) {
      return state.toMap();
    } else {
      return null;
    }
  }
}

List<String> availableFormats = ['jpg', 'png', 'pdf', 'jpeg', 'heic'];

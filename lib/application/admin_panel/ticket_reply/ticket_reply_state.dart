part of 'ticket_reply_bloc.dart';

@immutable
abstract class TicketReplyState {}

class TicketReplyInitial extends TicketReplyState {}

class TicketReplyEditing extends TicketReplyState {
  final String ticketId;
  final TextEditingController descriptionController;
  final String text;
  final KtList<PlatformFile> attachedFiles;
  final bool attachedInvalidFile;
  TicketReplyEditing({
    @required this.ticketId,
    @required this.text,
    @required this.descriptionController,
    @required this.attachedFiles,
    @required this.attachedInvalidFile,
  });

  factory TicketReplyEditing.intial(String ticketId) => TicketReplyEditing(
        ticketId: ticketId,
        text: '',
        descriptionController: TextEditingController(),
        attachedFiles: KtList.empty(),
        attachedInvalidFile: false,
      );

  Map<String, dynamic> toMap() {
    return {
      'ticketId': ticketId,
      'text': text,
      'attachedFiles': _attachedFilesToMap(attachedFiles),
      'attachedInvalidFile': attachedInvalidFile,
    };
  }

  factory TicketReplyEditing.fromMap(Map<String, dynamic> map) {
    return TicketReplyEditing(
      ticketId: map['ticketId'],
      descriptionController: TextEditingController(text: map['text']),
      text: map['text'],
      attachedFiles: _attachedFilesFromMap(map['attachedFiles']),
      attachedInvalidFile: map['attachedInvalidFile'],
    );
  }

  TicketReplyEditing copyWith({
    String ticketId,
    TextEditingController descriptionController,
    String text,
    KtList<PlatformFile> attachedFiles,
    bool attachedInvalidFile,
  }) {
    return TicketReplyEditing(
      ticketId: ticketId ?? this.ticketId,
      descriptionController:
          descriptionController ?? this.descriptionController,
      text: text ?? this.text,
      attachedFiles: attachedFiles ?? this.attachedFiles,
      attachedInvalidFile: attachedInvalidFile ?? this.attachedInvalidFile,
    );
  }

  @override
  String toString() {
    return 'TicketReplyEditing(descriptionController: ${descriptionController.text}, text: $text, attachedFiles: $attachedFiles, attachedInvalidFile: $attachedInvalidFile)';
  }
}

List<String> _attachedFilesToMap(KtList<PlatformFile> files) {
  return files.map((file) => file.path).asList();
}

KtList<PlatformFile> _attachedFilesFromMap(List<String> filePaths) {
  return filePaths
      .map((filePath) => PlatformFile(path: filePath, name: nameOf(filePath)))
      .toImmutableList();
}

class TicketReplyLoading extends TicketReplyState {}

class TicketReplySuccess extends TicketReplyState {}

class TicketReplyFailure extends TicketReplyState {}

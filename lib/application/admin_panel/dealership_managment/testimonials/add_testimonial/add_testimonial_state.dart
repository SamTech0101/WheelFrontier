part of 'add_testimonial_bloc.dart';

@immutable
abstract class AddTestimonialState {}

class AddTestimonialEditing extends AddTestimonialState {
  final PickedFile image;
  final TextEditingController nameController;
  final String name;
  final TextEditingController commentController;
  final String comment;
  final bool showAtHomePage;
  final bool waitingForApiResponse;
  final ApiResponse apiResponse;

  AddTestimonialEditing({
    this.image,
    @required this.nameController,
    @required this.name,
    @required this.commentController,
    @required this.comment,
    @required this.showAtHomePage,
    @required this.waitingForApiResponse,
    this.apiResponse,
  });

  factory AddTestimonialEditing.initial(Testimonial testimonial) {
    if (testimonial != null) {
      return AddTestimonialEditing(
        nameController: TextEditingController(text: testimonial.name),
        name: testimonial.name,
        commentController: TextEditingController(text: testimonial.comment),
        comment: testimonial.comment,
        waitingForApiResponse: false,
        showAtHomePage: testimonial.showAtHomePage,
      );
    } else {
      return AddTestimonialEditing(
        nameController: TextEditingController(),
        name: '',
        commentController: TextEditingController(),
        comment: '',
        waitingForApiResponse: false,
        showAtHomePage: false,
      );
    }
  }

  AddTestimonialEditing copyWith({
    PickedFile image,
    TextEditingController nameController,
    String name,
    TextEditingController commentController,
    String comment,
    bool showAtHomePage,
    bool waitingForApiResponse,
    ApiResponse apiResponse,
  }) {
    return AddTestimonialEditing(
      image: image ?? this.image,
      nameController: nameController ?? this.nameController,
      name: name ?? this.name,
      commentController: commentController ?? this.commentController,
      comment: comment ?? this.comment,
      showAtHomePage: showAtHomePage ?? this.showAtHomePage,
      waitingForApiResponse:
          waitingForApiResponse ?? this.waitingForApiResponse,
      apiResponse: apiResponse ?? this.apiResponse,
    );
  }

  @override
  String toString() {
    return 'AddTestimonialEditing(image: $image, nameController: $nameController, name: $name, commentController: $commentController, comment: $comment, showAtHomePage: $showAtHomePage, waitingForApiResponse: $waitingForApiResponse, apiResponse: $apiResponse)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddTestimonialEditing &&
        other.image == image &&
        other.nameController == nameController &&
        other.name == name &&
        other.commentController == commentController &&
        other.comment == comment &&
        other.showAtHomePage == showAtHomePage &&
        other.waitingForApiResponse == waitingForApiResponse &&
        other.apiResponse == apiResponse;
  }

  @override
  int get hashCode {
    return image.hashCode ^
        nameController.hashCode ^
        name.hashCode ^
        commentController.hashCode ^
        comment.hashCode ^
        showAtHomePage.hashCode ^
        waitingForApiResponse.hashCode ^
        apiResponse.hashCode;
  }
}

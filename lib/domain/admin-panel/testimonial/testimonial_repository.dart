import 'dart:io';
import 'package:abs_customer_sites/domain/admin-panel/testimonial/testimonial.dart';

abstract class TestimonialRepository {
  Future<List<Testimonial>> readAll(String dealershipId);
  Future<void> create(
    String dealershipId,
    File image,
    String name,
    String comment,
    bool shoudlShowAtHomePage,
  );
  Future<void> update(
    String testimonialId,
    File image,
    String name,
    String comment,
    bool shoudlShowAtHomePage,
  );
  Future<void> delete(String testimonialId);
}

class NoTestimonialException implements Exception {}

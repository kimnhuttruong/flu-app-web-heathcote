import 'package:b13_flutter/data/models/gp_practice.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'gp_practice_response.jser.dart';

class GpPracticeResponse {
  @Alias('organisations', isNullable: false)
  List<GpPractice> organisations;
}

@GenSerializer(nullableFields: true)
class GpPracticeResponseSerializer extends Serializer<GpPracticeResponse>
    with _$GpPracticeResponseSerializer {}

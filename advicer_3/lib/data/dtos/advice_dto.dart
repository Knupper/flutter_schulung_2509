import 'package:json_annotation/json_annotation.dart';

part 'advice_dto.g.dart';

@JsonSerializable()
class AdviceDto {
  AdviceDto({required this.id, required this.advice});

  @JsonKey(name:'advice_id')
  final int id;
  final String advice;


  factory AdviceDto.fromJson(Map<String, dynamic> json) => _$AdviceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AdviceDtoToJson(this);

  // manuelle alternative
  // factory AdviceDto.fromJson(Map<String, dynamic> json) {
  //   final dto = AdviceDto(id: json['advice_id'], advice: json['advice']);
  //   return dto;
  // }
}

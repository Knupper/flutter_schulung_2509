class AdviceDto {
  AdviceDto({required this.id, required this.advice});

  final int id;
  final String advice;

  factory AdviceDto.fromJson(Map<String, dynamic> json) {
    final dto = AdviceDto(id: json['advice_id'], advice: json['advice']);
    return dto;
  }
}

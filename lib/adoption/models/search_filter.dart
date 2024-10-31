class SearchFilter {
  final String? uprCd;
  final String? orgCd;
  final String? careRegNo;
  final String? state;
  final String? bgnde;
  final String? endde;
  final String? upkind;
  final String? kind;
  final String? neuterYn;

  const SearchFilter({
    this.uprCd,
    this.orgCd,
    this.careRegNo,
    this.state,
    this.bgnde,
    this.endde,
    this.upkind,
    this.kind,
    this.neuterYn,
  });

  Map<String, String?> toJson() {
    return {
      'upr_cd': uprCd,
      'org_cd': orgCd,
      'care_reg_no': careRegNo,
      'state': state,
      'bgnde': bgnde,
      'endde': endde,
      'upkind': upkind,
      'kind': kind,
      'neuter_yn': neuterYn,
    }..removeWhere((key, value) => value == null);
  }

  SearchFilter copyWith({
    String? uprCd,
    String? orgCd,
    String? careRegNo,
    String? state,
    String? bgnde,
    String? endde,
    String? upkind,
    String? kind,
    String? neuterYn,
  }) {
    return SearchFilter(
      uprCd: uprCd ?? this.uprCd,
      orgCd: orgCd ?? this.orgCd,
      careRegNo: careRegNo ?? this.careRegNo,
      state: state ?? this.state,
      bgnde: bgnde ?? this.bgnde,
      endde: endde ?? this.endde,
      upkind: upkind ?? this.upkind,
      kind: kind ?? this.kind,
      neuterYn: neuterYn ?? this.neuterYn,
    );
  }
}

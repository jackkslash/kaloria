enum ExpandedSection { none, date, scan, add }

class NavBarState {
  final ExpandedSection expanded;

  const NavBarState({this.expanded = ExpandedSection.none});

  double get currentHeight {
    switch (expanded) {
      case ExpandedSection.date:
        return 300.0;
      case ExpandedSection.scan:
        return 400.0;
      case ExpandedSection.add:
        return 300.0;
      default:
        return 125.0;
    }
  }

  NavBarState copyWith({ExpandedSection? expanded}) {
    return NavBarState(expanded: expanded ?? this.expanded);
  }
}

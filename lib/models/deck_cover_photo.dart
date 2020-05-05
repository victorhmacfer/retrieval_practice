class DeckCoverPhoto {
  final String id;
  final String url;
  final String downloadLink;

  DeckCoverPhoto({this.id, this.url, this.downloadLink});

  factory DeckCoverPhoto.fromMap(Map<String, dynamic> map) {
    return DeckCoverPhoto(
      id: map['id'],
      url: map['urls']['small'],
      downloadLink: map['links']['download_location']
    );
  }
}

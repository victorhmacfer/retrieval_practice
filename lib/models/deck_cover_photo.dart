class DeckCoverPhoto {
  final String id;

  //TODO: this will change.. right now it is the url for small size.. I will have custom sizes
  final String url;

  final String downloadLink;

  DeckCoverPhoto({this.id, this.url, this.downloadLink});

  factory DeckCoverPhoto.fromMap(Map<String, dynamic> map) {
    return DeckCoverPhoto(
      id: map['id'],
      // TODO: IM ALWAYS GRABBING THE SMALL ONE.. CHANGE THIS LATER
      url: map['urls']['regular'],
      downloadLink: map['links']['download_location']
    );
  }
}

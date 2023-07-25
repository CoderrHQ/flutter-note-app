class NoteModel {
  String? noteTitle;
  String? noteDescription;
  String? noteId;
  String? userId;
  final noteDate;

  NoteModel({
    this.noteTitle,
    this.noteDescription,
    this.noteId,
    this.userId,
    this.noteDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'noteTitle': noteTitle,
      'noteDescription': noteDescription,
      'noteId': noteId,
      'userId': userId,
      'noteDate': noteDate,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      noteTitle: map['noteTitle'] != null ? map['noteTitle'] as String : null,
      noteDescription: map['noteDescription'] != null
          ? map['noteDescription'] as String
          : null,
      noteId: map['noteId'] != null ? map['noteId'] as String : null,
      userId: map['userId'] != null ? map['userId'] as String : null,
      noteDate: map['noteDate'],
    );
  }
}

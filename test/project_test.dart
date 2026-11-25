import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/models/project.dart';

void main() {
  test('Project.fromJson membaca key snake_case dari API', () {
    final project = Project.fromJson({
      'id': 'abc-123',
      'title': 'Judul',
      'description': 'Deskripsi',
      'category': 'web',
      'category_display': 'Web Application',
      'thumbnail': null,
      'started_at': '2026-11-01T00:00:00Z',
      'ended_at': null,
      'is_ongoing': true,
      'star_count': 2,
    });

    expect(project.id, 'abc-123');
    expect(project.title, 'Judul');
    expect(project.categoryDisplay, 'Web Application');
    expect(project.isOngoing, true);
    expect(project.starCount, 2);
  });

  test('Project.toJson tidak mengirim field read-only', () {
    const project = Project(
      title: 'Judul',
      description: 'Deskripsi',
      category: 'mobile',
    );

    final json = project.toJson();

    expect(json['title'], 'Judul');
    expect(json['category'], 'mobile');
    expect(json.containsKey('id'), false);
    expect(json.containsKey('star_count'), false);
  });
}

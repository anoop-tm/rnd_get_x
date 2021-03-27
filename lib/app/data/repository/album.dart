import 'package:meta/meta.dart';
import 'package:rnd_get_x/app/data/provider/album.dart';

class AlbumRepository {
  final AlbumApiClient apiClient;

  AlbumRepository({@required this.apiClient}) : assert(apiClient != null);

  getAll() {
    return apiClient.getAll();
  }

//   getId(id) {
//     return apiClient.getId(id);
//   }
//
//   delete(id) {
//     return apiClient.delete(id);
//   }
//
//   edit(obj) {
//     return apiClient.edit(obj);
//   }
//
//   add(obj) {
//     return apiClient.add(obj);
//   }
}
